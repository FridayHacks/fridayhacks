# Cloudflare Workers deployment

FridayHacks targets Workers Static Assets, matching the current Automators and
Decentralizers setups. GitHub Actions validates Jekyll builds only. Cloudflare
deployment, domain cutover, and persisted telemetry have not been verified.

## Build settings

Connect the GitHub repository to a Worker named `fridayhacks`:

| Setting | Value |
| --- | --- |
| Production branch | `master` |
| Root directory | `/` |
| Build command | `bundle install && bundle exec jekyll build` |
| Deploy command | `npx wrangler deploy --config ./wrangler.jsonc` |
| Build variable | `JEKYLL_ENV=production` |
| Build variable | `SKIP_DEPENDENCY_INSTALL=true` |

Ruby is pinned to 3.2.3 in `.ruby-version`. Explicit gem installation avoids
installing the legacy Grunt dependencies in `package.json`; theme assets are
already committed. Publish `_site/` using the committed Wrangler configuration.
Do not select a Pages project or accept an inferred Grunt build or `dist` output.
Merge and push to `master` before building; retrying an old build uses its old
commit. Check the deployment SHA.

## Dependency installation failure

If the log shows `Installing project dependencies: bun install` followed by an
`optipng-bin` postinstall error, Cloudflare is installing the legacy Grunt image
tools before the build command runs. Jekyll does not require those tools.

In the Worker's **Settings > Build > Build variables and secrets**, add
`SKIP_DEPENDENCY_INSTALL` with value `true`. This must be a build variable;
setting it in Worker runtime variables, `wrangler.jsonc`, or the build command
does not affect the earlier dependency installation phase. Keep the explicit
`bundle install && bundle exec jekyll build` command above, then start a new build.
The next log should skip automatic Bun installation and reach the Jekyll build.
If Bun still runs, check that the variable was saved on the Worker being built.

The 2026-11-14 failed build installed Ruby 3.2.3 successfully but failed in
`optipng-bin` under Node 24.18.0 before reaching Jekyll. Cloudflare deployment
remains unverified until a subsequent build succeeds.

## Preview verification

`src/worker.js` forwards requests to `ASSETS`. Worker-first routing enables
invocation logs for pages and missing URLs. Custom `404.html` handling is enabled.
Logs and traces persist with 100% sampling; all asset requests invoke the Worker
and count toward Worker request usage.

On the assigned `workers.dev` preview:

1. Verify `/`, an existing post, pagination, CSS/JS, `/feed.xml`, `/sitemap.xml`,
   `/robots.txt`, and `/llms.txt`. Preview canonical URLs retain the production host.
2. Request `/telemetry-check-missing` and `/nested/telemetry-check-missing` with
   `curl -i`; both must return the custom page with HTTP 404.
3. Confirm `/CLAUDE.md`, `/AGENTS.md`, `/CHANGELOG.md`, `/VERSION`, `/CNAME`,
   `/wrangler.jsonc`, `/src/worker.js`, and `/docs/deployment.md` return HTTP 404.
4. In Cloudflare Observability > Logs, locate invocations for `/` and both missing
   paths. Record the deployment SHA, timestamp, response statuses, and log evidence.

Local builds cannot verify Cloudflare routing or persisted telemetry.

## Domain cutover and rollback

After preview verification, attach `www.fridayhacks.com` as a Worker custom
domain. Review existing GitHub Pages DNS records, Worker routes, and Pages domain
bindings first. Preserve prior DNS values and unrelated records. Configure and
verify the apex `fridayhacks.com` redirect to `https://www.fridayhacks.com`, retaining
paths and query strings. `CNAME` remains legacy source information and is excluded
from output; it does not configure Cloudflare domains.

Verify production HTTPS, posts, assets, redirects, and missing URLs before
disabling GitHub Pages in repository settings. Repository changes alone do not
disable GitHub Pages or move DNS. If cutover fails, restore previous domain bindings
and DNS. For a faulty Worker release, roll back to a verified Cloudflare deployment
and revert the faulty repository change before the next production push.

References: [Workers routing](https://developers.cloudflare.com/workers/static-assets/routing/worker-script/)
and [Wrangler configuration](https://developers.cloudflare.com/workers/wrangler/configuration/).

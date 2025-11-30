# CLAUDE.md - FridayHacks Project Guide

## Project Overview

FridayHacks is a technical blog documenting software engineering projects, experiments, and tutorials. The site is built with Jekyll and hosted on GitHub Pages at https://www.fridayhacks.com.

The blog started in 2015 and covers topics including:
- AI and machine learning projects
- Web development tutorials
- Developer tools and workflows
- Security and infrastructure
- Hackathon projects

## Technology Stack

- **Static Site Generator**: Jekyll 3.7
- **Theme**: HPSTR Jekyll Theme (customized)
- **Markdown**: Kramdown with GFM (GitHub Flavored Markdown)
- **Syntax Highlighting**: Rouge
- **CSS Preprocessor**: SCSS/Sass
- **Analytics**: Umami (privacy-friendly)
- **Hosting**: GitHub Pages
- **Domain**: fridayhacks.com

## Project Structure

```
fridayhacks/
├── _config.yml          # Jekyll configuration
├── _data/
│   └── navigation.yml   # Navigation menu links
├── _includes/           # Reusable HTML partials
│   ├── head.html        # Meta tags, CSS, analytics
│   ├── navigation.html  # Site navigation
│   ├── footer.html      # Footer content
│   ├── scripts.html     # JavaScript includes
│   └── ...
├── _layouts/
│   ├── post.html        # Blog post layout
│   ├── page.html        # Static page layout
│   └── post-index.html  # Post listing layout
├── _posts/              # Blog posts (YYYY-MM-DD-slug.md)
├── _sass/               # SCSS stylesheets
├── _site/               # Generated site (do not edit)
├── assets/
│   ├── css/main.scss    # Main stylesheet
│   ├── fonts/           # Font Awesome fonts
│   ├── img/             # Images for posts
│   └── js/              # JavaScript files
├── about/               # About page
├── posts/               # Posts index page
├── tags/                # Tags index page
├── CHANGELOG.md         # Project changelog
├── Gemfile              # Ruby dependencies
├── Makefile             # Build commands
└── index.html           # Homepage
```

## Writing Blog Posts

### File Naming Convention

Posts must be placed in `_posts/` with the format:
```
YYYY-MM-DD-slug.md
```

Example: `2025-11-29-norai.md`

### Frontmatter Template

Every post must start with YAML frontmatter:

```yaml
---
layout: post
title: "Your Post Title Here"
description: "A brief description for SEO and social sharing."
tags: [tag1, tag2, tag3]
---
```

### Optional Frontmatter Fields

```yaml
---
layout: post
title: "Post with Feature Image"
description: "Description here"
tags: [example]
image:
  feature: feature-image.jpg    # Hero image (1600x800 recommended)
  thumb: thumb-image.jpg        # Thumbnail
  credit: Photographer Name     # Image credit
  creditlink: https://source.com
modified: 2025-01-15            # Last modified date
share: false                    # Disable social sharing
comments: false                 # Disable comments
---
```

### Content Guidelines

1. **Headings**: Start with `###` (h3) since the title is h1
2. **Images**: Store in `/assets/img/` or subdirectories like `/assets/img/projectname/`
3. **Image syntax**: `![Alt text](/assets/img/image.png)` or `![Alt text]({{ site.url }}/assets/img/image.png)`
4. **Code blocks**: Use triple backticks with language identifier
5. **Links**: Use standard markdown `[text](url)`

### Style Rules

- **No emojis** in posts or content
- **No em dashes** (use regular dashes or rewrite sentences)
- **No smart quotes** (use straight quotes)
- Keep descriptions concise (under 160 characters for SEO)
- Use active voice
- Include code examples where relevant
- Add diagrams using ASCII art in code blocks when helpful

### Example Post Structure

```markdown
---
layout: post
title: "Project Name: Brief Description"
description: "One sentence summary of the post."
tags: [technology, category, tool]
---

![Project Banner](/assets/img/project/banner.png)

### Introduction

Opening paragraph explaining the problem or motivation.

### Section Title

Content with code examples:

\`\`\`python
def example():
    return "Hello, World!"
\`\`\`

### Another Section

More content...

### Conclusion

Wrap-up and key takeaways.

---

*Optional footer note or credits*
```

## Development Commands

### Using Make (Recommended)

```bash
make install    # Install Ruby dependencies
make run        # Serve site locally with live reload
make serve      # Alias for run
make build      # Build site for production
make clean      # Clean generated files
make help       # Show available commands
```

### Direct Jekyll Commands

```bash
bundle install                                    # Install dependencies
bundle exec jekyll serve --livereload            # Local development
bundle exec jekyll serve --host 0.0.0.0 --port 4000  # Accessible on network
bundle exec jekyll build                         # Production build
```

### Local Development URL

```
http://localhost:4000
```

## Adding Images

1. Create a subdirectory in `/assets/img/` for the project: `/assets/img/projectname/`
2. Add images with descriptive names: `homepage.png`, `diagram.png`
3. Optimize images before committing (compress PNGs, use appropriate formats)
4. Reference in posts: `![Description](/assets/img/projectname/image.png)`

Recommended image sizes:
- Feature images: 1600x800px
- Inline images: 800-1200px width
- Thumbnails: 400x400px

## Configuration

### _config.yml Key Settings

```yaml
title: FridayHacks
url: https://www.fridayhacks.com
timezone: America/New_York
paginate: 5                    # Posts per page on homepage
permalink: /:categories/:title/

owner:
  name: FridayHacks
  email: contact@fridayhacks.com
  x: fridayhacks               # X/Twitter handle
```

### Adding Navigation Links

Edit `_data/navigation.yml`:

```yaml
- title: About
  url: /about/

- title: External Link
  url: https://example.com
```

## Git Workflow

### Branch Structure

- `master` - Main branch, deployed to production
- Feature branches for new posts or changes

### Commit Messages

For new posts:
```
add [post-slug] article
```

For updates:
```
update [description of change]
```

For fixes:
```
fix [description of fix]
```

### Updating the Changelog

After adding a new post, update `CHANGELOG.md`:

```markdown
## YYYY-MM-DD

### Added
- **Post Title** - Brief description of the post content and what it covers.
```

## Common Tasks

### Creating a New Post

1. Create file: `_posts/YYYY-MM-DD-slug.md`
2. Add frontmatter with title, description, tags
3. Write content following style guidelines
4. Add images to `/assets/img/slug/`
5. Test locally with `make run`
6. Update `CHANGELOG.md`
7. Commit and push

### Updating Site Configuration

1. Edit `_config.yml`
2. Restart Jekyll server (changes require restart)
3. Test locally before pushing

### Adding a New Page

1. Create directory: `/pagename/`
2. Create `index.md` with frontmatter:
   ```yaml
   ---
   layout: page
   title: "Page Title"
   ---
   ```
3. Add to navigation in `_data/navigation.yml` if needed

## Dependencies

### Ruby Gems (Gemfile)

- jekyll ~> 3.7
- jekyll-sitemap
- jekyll-feed
- jekyll-paginate
- jekyll-gist
- kramdown-parser-gfm
- webrick ~> 1.7

### External Resources

- Google Fonts (Lato)
- Font Awesome 6.5.1 (CDN)
- Umami Analytics

## Troubleshooting

### Common Issues

**Jekyll won't start**
```bash
bundle install
bundle exec jekyll serve
```

**Styles not updating**
```bash
make clean
make run
```

**Liquid template errors**
- Check frontmatter YAML syntax
- Ensure proper closing of Liquid tags
- Check for special characters in titles/descriptions

**Images not showing**
- Verify path starts with `/assets/img/`
- Check file exists and is committed
- Ensure filename matches exactly (case-sensitive)

## Code Style in Posts

### Supported Languages for Syntax Highlighting

Common languages: `bash`, `python`, `javascript`, `ruby`, `html`, `css`, `json`, `yaml`, `sql`, `go`, `rust`, `typescript`

### ASCII Diagrams

Use code blocks for architecture diagrams:

```
┌─────────────────┐    ┌─────────────────┐
│   Component A   │───▶│   Component B   │
└─────────────────┘    └─────────────────┘
```

Box-drawing characters: `─ │ ┌ ┐ └ ┘ ├ ┤ ┬ ┴ ┼ ▶ ▼`

## Contact

- Website: https://www.fridayhacks.com
- Email: contact@fridayhacks.com
- X/Twitter: @fridayhacks

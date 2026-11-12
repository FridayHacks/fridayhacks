# Changelog

All notable changes to FridayHacks are documented in this file.

## 1.1.8 - 2026-11-12

### Changed
- **Homepage title link** - Made the FridayHacks hero title link to the homepage, including from paginated pages.

## 1.1.7 - 2026-11-12

### Fixed
- **Homepage navigation dropdown** - Gave the dropdown and animated submenu panels their own responsive dimensions below the burger button, preventing clipping to the button's width and height.

## 1.1.6 - 2026-11-12

### Fixed
- **Hero header placement** - Left-aligned the burger icon and FridayHacks title as one row and centered that row vertically within the hero image.

## 1.1.5 - 2026-11-12

### Changed
- **Homepage header alignment** - Centered the burger menu and title together as a single horizontal group.

## 1.1.4 - 2026-11-12

### Fixed
- **Homepage header row** - Placed the title beside the burger menu in the same row on desktop and mobile, with responsive sizing and a 16px gap.

## 1.1.3 - 2026-11-12

### Fixed
- **Homepage title spacing** - Replaced inherited heading margins with explicit responsive insets, aligned the desktop title with the menu, reserved space below the menu, and scaled the title for narrow screens.

## 1.1.2 - 2026-11-12

### Changed
- **Homepage title** - Aligned the banner title to the left on desktop and mobile, including paginated homepages. Documented the alignment setting.

## 1.1.1 - 2026-11-12

### Changed
- **Contribution requirements** - Require relevant documentation, `CHANGELOG.md`, and `VERSION` updates for every change in both contributor guides, with semantic versioning and consistent release numbers.

## 1.1.0 - 2026-11-12

### Added
- **Just commands** - Added `just install`, `just run`, and `just help` for dependency installation and local development with live reload.
- **Search discovery** - Added BlogPosting and WebPage structured data, crawler guidance in `robots.txt`, and a generated `llms.txt` index of published articles.

### Changed
- **SEO and social previews** - Improved default and homepage descriptions, canonical URLs, Twitter/X cards, Open Graph metadata, and archive headings. Added a banner fallback for missing preview images.
- **Umami analytics** - Switched to the Semanttica-hosted script and updated the website ID.
- **Contributor guidance** - Documented Just commands and search metadata conventions. Explicitly prohibited emojis and em dashes in blog posts in both `CLAUDE.md` and `AGENTS.md`.
- **Version** - Bumped from 1.0.0 to 1.1.0.

### Fixed
- **404 indexing** - Excluded the error page from the sitemap and marked it noindex.
- **Site output** - Excluded the justfile from generated pages.
- **Changelog history** - Removed existing merge-conflict markers while preserving both historical entries.

## 2026-01-23

### Added
- **Argparse vs Click: Why Every Prototype Deserves a CLI** - Comparison of Python CLI frameworks with practical examples. Covers the benefits of CLI-first development, side-by-side comparison of argparse and Click, and building production-grade tools with Rich, loguru, and Pydantic.

## 2025-12-30

### Added
- **VERSION file** - Added semantic versioning starting at v1.0.0.
- **docs/ folder** - Created project documentation structure with ROADMAP.md and TODO.md for tracking improvements and future plans.
- **twitter:site meta tag** - Improved social sharing cards on Twitter/X.

### Changed
- **About page** - Rewrote content to reflect the "technical playground" vision, updated categories to match current focus areas (AI/ML, Developer Tools, Web Development, Infrastructure), and updated modified date.

### Removed
- **Font Awesome SCSS** - Removed 14 unused SCSS files from `_sass/vendor/font-awesome/` (now using CDN).
- **Font Awesome fonts** - Removed 6 unused font files from `assets/fonts/` (now using CDN).

## 2025-11-29

### Added
- **NORAI: Building Canada's Sovereign AI Platform** - A grassroots effort to promote Canada's AI-for-science ecosystem, inspired by the US Department of Energy's Genesis Mission. Covers the vision for a bilingual, Indigenous-consent-aware national platform built with Next.js 15.

## 2025-11-21

### Added
- **From Localhost to the World: Using ngrok with Your Flask Application** - Tutorial on exposing local Flask applications to the internet using ngrok. Covers webhook testing, mobile device testing, HTTPS, and the ngrok web interface.

## 2025-10-31

### Added
- **3I/ATLAS: Building a Real-Time Interstellar Object Tracker with AI** - Comprehensive analytics dashboard for tracking the third confirmed interstellar object. Features Highcharts visualizations, D3.js solar system animation, hyperbolic orbit calculations, and internationalization (English, Spanish, Chinese, Russian). Built with Claude Code.

## 2025-10-18

### Added
- **Brandana: Participating at the Nanobanana Hackathon** - AI-powered platform for automated marketing asset generation. Combines Google Gemini for brand analysis with FAL.ai for image generation to create social media graphics, marketing banners, and brand illustrations.

## 2025-08-04

### Added
- **NightAgents: The AI Co-Worker That Works The Night Shift** - Exploration of a time-boxed AI development approach where AI agents work during off-hours to control costs and improve focus.
- **Building Modular Applications with Semablocks** - Internal approach to building modular, reusable code blocks inspired by Lego. Covers composing small versioned blocks in Bash, Python, and Go into composite workflows.

## 2025-08-09

### Fixed
- Minor bugfixes

## 2025-07-28

### Added
- **ShipReport: A Logging and Self-Journaling Tool** - Tool for daily progress logging and self-journaling. Explores how documenting work builds motivation and enables clear progress tracking.

## 2025-07-27

### Changed
- Clean up social icons
- Small UI updates and improvements

## 2024-06-29

### Added
- Umami analytics integration for privacy-friendly website analytics

## 2022-02-26

### Added
- **Polydigital Website Prototype** - Simple "Launching Soon" website for Polydigital, a Web3/dWeb startup focused on Ethereum and Handshake blockchains. Built with BootstrapMade WeBuild template and hosted on GitHub Pages.

## 2022-02-19

### Added
- **Uptime Monitoring with UptimeRobot** - Guide to monitoring website uptime using the UptimeRobot service.

## 2022-01-29

### Changed
- Site brought back online after years of inactivity
- Updated Ruby and Jekyll dependencies
- Fixed blocking issues preventing new posts

### Added
- **Back Online** - Announcement post for FridayHacks returning

## 2019-08-27

### Changed
- Updated repository path

## 2018-10-04

### Fixed
- Fixed Liquid Exception in posts
- Renamed `gems` array to `plugins` for Jekyll compatibility

### Changed
- Bumped Jekyll to 3.7 to fix security vulnerabilities
- Updated Gemfile and gitignore

## 2018-08-31

### Added
- Instagram social link

### Changed
- Updated CNAME configuration

## 2018-02-16

### Added
- **[FH #9] Prototyping Friday Hacks App** - Application prototype for proposing, upvoting, and forming teams around Friday Hacks project ideas.

## 2017-12-08

### Added
- **[FH #8] Building a Presentation Template Using the Reveal.js Framework** - HTML-based presentation template for technical speakers using Reveal.js.

## 2017-12-01

### Added
- **[FH #7] Turning Friday Hacks into a Jekyll Blog** - Converted FridayHacks from a static GitHub Pages site to a dynamic Jekyll-powered blog.

## 2017-11-24

### Added
- **[FH #6] OpenNEAR Website** - Designed logo and website for the OpenNEAR project using LogoMakr.

## 2017-04-27

### Added
- **[FH #5] Big Data Email with Mailsteward** - Mac-specific solution for email search and archiving using Mailsteward application.

## 2016-12-02

### Added
- **[FH #4] Securing your passwords with KeePassX** - Guide to using KeePassX password manager for secure password storage.

## 2016-11-25

### Added
- **[FH #3] Securing Your Traffic with a VPN** - Overview of VPN services (Private Internet Access, NordVPN, ExpressVPN) for privacy and security.

## 2016-11-04

### Added
- **[FH #2] Sending SMS Notifications with Twilio** - SMS notification system using the Twilio API, built during the 2016 MCIN internal hackathon.

## 2015-10-25

### Added
- **[FH #1] Building a Better terminal experience with Tmuxinator and Oh-My-Fish** - First FridayHacks post covering terminal improvements with Tmuxinator and Oh-My-Fish shell.

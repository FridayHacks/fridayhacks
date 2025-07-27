---
layout: post
title: "[FH #7] Turning Friday Hacks into a Jekyll Blog"
description: "Examples and code for displaying images in posts."
tags: [sample post, images, test]
---

Today's hack is about turning Friday Hacks' boring static Github Pages website
into a more dynamic blogging platform powered by Jekyll. In order to do that,
I set to find a sample template that would fit the style and content of this site.
The [HPSTR theme](https://github.com/mmistakes/hpstr-jekyll-theme) by mmistakes
was the perfect fit

### Before

![Friday Hacks 1]({{ site.url }}/assets/img/fh1.png)
FridayHacks website, using static Github Pages

### After

![Friday Hacks 2]({{ site.url }}/assets/img/fh2.png)
FridayHacks website, using HPSTR Jekyll theme

First, I had to fork the [HPSTR repository](https://github.com/mmistakes/hpstr-jekyll-theme),
cloned it on my sandbox, and installed dependencies with

```ruby
 bundle install
```

Then, I modified certain files such as `_config.yml` and `navigation.yml`, and
I also did a bit of clean up (removed sample blog posts and unused pictures).

Now, every time I want to add a new post, I add it to the `_posts` folder with a .md
extension. Then, need to test it in localhost by changing url parameter
in the `_config.yml` file to serve in localhost instead of the fridayhacks.com url:

```yaml
 url: #http://fridayhacks.com
```
Then, I need to run the following commands:

```ruby
 bundle exec jekyll build
 bundle exec jekyll serve
```

If all goes well, I uncomment the `url` in the `_config.yml` file and push it
directly to Github.

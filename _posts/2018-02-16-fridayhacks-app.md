---
layout: post
title: "[FH #9] Prototyping Friday Hacks App"
description: "Friday Hacks App"
tags: [sample post, images, test]
---

In today's hack, we decided to build an application that will help future editions
of Friday Hacks. Basically, the application lets you propose projects to work on.
Then, users will be able to upvote or downvote ideas and then allows to form teams
to work on the best ideas.

After the hacking event is finished, projects are ranked by points. As a reward
system, points could be exchanged for free working hours. For instance, after reaching
enough points, it could be exchanged for a day off.

Here is the basic [prototype](https://github.com/fridayhacks/friday-hacks-app):

It is a simple Django application with a login system, coupled with a Postgres
database. There are 3 models:
* Team Model: Model for creating teams. A user joins a team.
* Project model: Model for proposed projects. A project has a team associated with it
* Rank Model: Model for reward system. Projects and teams are ranked and get points

Basic UI:

![Prototype]({{ site.url }}/assets/img/friday-hacks-app.png)

The application is still very basic and contains some minor errors. Next week,
we hope to continue working on mechanical details such as
* Project and Team proposals
* Matching algorithm for projects and teams
* reddit-like upvote/downvote system for proposed projects.
* Ranking system and point allocation for projects and teams

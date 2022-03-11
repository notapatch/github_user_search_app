# Frontend Mentor - GitHub user search app solution

This is a solution to the [GitHub user search app challenge on Frontend Mentor](https://www.frontendmentor.io/challenges/github-user-search-app-Q09YOgaH6). Frontend Mentor challenges help you improve your coding skills by building realistic projects.

## Table of contents

- [Overview](#overview)
    - [The challenge](#the-challenge)
    - [Screenshot](#screenshot)
    - [Links](#links)
- [My process](#my-process)
    - [Built with](#built-with)
    - [What I learned](#what-i-learned)
    - [Continued development](#continued-development)
    - [Useful resources](#useful-resources)
- [Author](#author)
- [Acknowledgments](#acknowledgments)

**Note: Delete this note and update the table of contents based on what sections you keep.**

## Overview

### The challenge

Users should be able to:

- View the optimal layout for the app depending on their device's screen size
- See hover states for all interactive elements on the page
- Search for GitHub users by their username
- See relevant user information based on their search
- Switch between light and dark themes
- **Bonus**: Have the correct color scheme chosen for them based on their computer preferences. _Hint_: Research `prefers-color-scheme` in CSS.

### Screenshot

#
# TODO
#

![](./screenshot.jpg)


### Links

- Solution URL: [Github user search app](https://github.com/notapatch/github_user_search_app)
- Live Site URL: [Add live site URL here](https://your-live-site-url.com)

## My process

### Built with

- Rails 7.0
- [Tailwindcss](https://tailwindcss.com/docs/installation)
- Flexbox
- CSS Grid
- Mobile-first workflow
- [VCR](https://github.com/vcr/vcr) - Recording network requests
- [Webmock](https://github.com/bblimke/webmock) - Mocking network requests

### What I learned

### Stimulus JS into smaller components

In the past I tried to make a component do all the requirements. However, you can also
sometimes have two components with different effects and the composite of their actions 
can be complex. In this case I have two controllers one which toggles adding a class to the root
of the page and another which toggles the visibility of elements on the page. They combine to
make a light / dark color scheme toggle button.

- mode_switch_controller.js
- visibility_controller.js

### Got into a mix with controllers and search page

Normally, a search page displays an index of items and your search filters it out. You
see the search action is embedded under the index action. However, this search is a 
show action. I'm used to showing by `#create` and then `#show` the page. This causes a
lot of issues because you have to retain the API response data between the `create` and
`show`. The final solution was, obviously, to treat the show action like you would an
index action: just use the one action, `show`, and display any valid results.

### Search with virtual model

Rails 5.1 introduced `form_with`, however, there's no good explanation in the Rails docs
about using it to search without an ActiveRecord model backend. [There's a good stackoverflow answer covering it](https://stackoverflow.com/a/53209240/1511504).
The Github API search has no database backend requirement. However, if you make the search
request a virtual model, via `include ActiveModel::Model` it gives flexibility on validation,
changing text of attributes using i18n. 

When a search is simple you might get away with not needing a search-model but as it gets more
complicated then a Search model makes the code cleaner. I did modeless search completed on 
this commit 9c2d29a before doing a model on this commit 8107dce.

### Curl with authorization using Personal Access Tokens

Most straightforward way of getting authorized requests with Github API is
with Personal Access Tokens. You can use them by adding them to the header
of a request see below.

```bash
curl -i -H "Authorization: token ghp_pk6VP4xQYxdekLk16hAublcuhGu3ax2rOz3F" \ 
  https://api.github.com/users/tenderlove
```

### Continued development

Use this section to outline areas that you want to continue focusing on in future projects. These could be concepts you're still not completely comfortable with or techniques you found useful that you want to refine and perfect.

**Note: Delete this note and the content within this section and replace with your own plans for continued development.**

### Useful resources

- [Example resource 1](https://www.example.com) - This helped me for XYZ reason. I really liked this pattern and will use it going forward.
- [Example resource 2](https://www.example.com) - This is an amazing article which helped me finally understand XYZ. I'd recommend it to anyone still learning this concept.

**Note: Delete this note and replace the list above with resources that helped you during the challenge. These could come in handy for anyone viewing your solution or for yourself when you look back on this project in the future.**

## Author

- Website - [Add your name here](https://www.your-site.com)
- Frontend Mentor - [@yourusername](https://www.frontendmentor.io/profile/yourusername)
- Twitter - [@yourusername](https://www.twitter.com/yourusername)

**Note: Delete this note and add/remove/edit lines above based on what links you'd like to share.**

## Acknowledgments

- [Show and Hide Elements With Rails 7's Stimulus](https://betterprogramming.pub/show-and-hide-elements-with-rails-7s-stimulus-e988c35fbfb3) One controller to handle all visibility issues.

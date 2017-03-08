# Developer Portal for North America

## Contents

* [Build the site](#build-the-site)
* [Branching and merging](#branching-and-merging)
* [Editing the docs](#editing-the-docs)
* [Making non-documentation changes to the site](#making-non-documentation-changes-to-the-site)

## Build the site

### Docker

The simplest way to get set up is to use the included Dockerfile (must install docker first).

```shell
git clone https://github.com/bambora/dev.na.bambora.com.git
cd dev.na.bambora.com
docker build -t devbamboracom .

# For windows:
docker run -v $pwd/source/:/usr/src/app/source -p 4567:4567 devbamboracom

# For linux:
docker run -v `pwd`/source:/usr/src/app/source -p 4567:4567 devbamboracom
```

You can now see the docs at <http://localhost:4567>. The site will update with changes you make when a page is reloaded.

### Run locally

Alternatively, you can build and run the site locally. You're going to need: 

* **Linux , OS X, windows**.
* **Ruby, version 1.9.3 or newer**
* **Node.js**
* **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.


```shell
git clone https://github.com/bambora/dev.na.bambora.com.git
cd dev.na.bambora.com
bundle install
```

To start the preview web server:

```shell
EXECJS_RUNTIME=Node bundle exec middleman server
```

If you want to build the static site files only then run:

```shell
bundle exec rake static
```

If you want to run the static site in a standalone simple web server run:

```shell
bundle exec rake run
```

## Editing the docs

### Ways to make changes

There are two ways to make changes to the documentation:

#### Through you web browser

Every page of the developer portal has an 'Edit this page' button in the top right corner. Clicking this will prompt you to create or sign in to a Github account and fork the developer portal repository. You will then be taken to the markdown version of the page you wish to edit. After making your changes, click propose file changes and then create a pull request against the master branch of the repository. Your changes will be reviewed and merged into the developer portal.

#### Through a git branch

Larger changes to the documentation should be made locally on a branch of the repository. See the [Branching and merging](#branching-and-merging) section for details on the branching strategy of the repository. The documentation lives in the `source/docs/` folder of the repository.

### Formatting Content

The documentation pages on the site are written in [YAML](https://learnxinyminutes.com/docs/yaml/) and [Markdown](http://commonmark.org/help/). YAML is used to define frontmatter configuration for each page (e.g. specifying it's template) and Markdown is used to write the actual documentation.

### YAML

Every page on the site has YAML frontmatter to configure the page. The yaml is defined between three dashes on either side. Some fields are required, some are optional, and some are [layout specific](#layouts). Order is not important. Here's some example frontmatter showing fields that apply to all layouts: 

```yaml
---
# Required Fields 
title: Example Title      # Used for the browser page title and search results. 
layout: tutorial          # The layout (see layout section) to use the render the page. 
navigation:               # An object specifying the header, footer, and table of contents to use (see navigation section).
  header: site_header         # The header config file 
  footer: site_footer         # The footer config file 
  toc: example_toc            # The table of contents config file 
  header_active: Guides       # The link in the header to highlight as activated

summary: >                  # A summary of the page displayed in search results.  
  An example page showing   # Typically the first sentence(s) of the page serve as a good summary.
  frontmatter configuration. 

# Optional fields 
breadcrumbs: false

# Page includes           
includes:                 # You can define and import sub-pages in top level pages to separate content.
  - web/checkout          # You will need to add the actual file to the source/includes/ directory and  
  - web/hosted_fields     # prefix it with an underscore, but make sure to leave that out when adding 
  - web/my_new_topic      # it in the includes section. 
---
```

For the YAML fields specific to each layout, see the [layouts](#layouts) section. 

#### Navigation 

The configuration for the header, footer, and table of contents for each page are defined in separate files in the `data/` folder of the site. This way a header and footer can be shared site wide, or a table of contents can be used on a series of related pages. 

"Dot notation" is used to specify the path to the data files. The data folder and the file's extension are not used. For example to use a header config located at `data/navigation/site_header.yaml` set the header key of the navigation to `header: navigation.site_header`. 

##### Header files

The header config file referenced in the navigation object defines the header for the page. It's written in YAML. A header config file looks like this (`data/example_nav.yaml`): 

```yaml
logo:         # Defines the logo for the header 
  link: /docs/            # A href value for when the logo is clicked 
  light: "logo_light.svg" # The light version of the image to display on a dark header (e.g. landing page) 
  dark:  "logo_dark.svg"  # The dark version of the image to display on a light header 
links:        # A list of the site links to show to the left of the header 
  - file: /docs/guides/   # The href location of the link 
    title: Guides         # The text value of the link 
  - file: /docs/references/
    title: References 
buttons:      # The buttons to show to the right of header 
  - file: /docs/sign_up   # The href location of the button 
    title: Sign up        # The text value of the button 
    secondary: true       # Optional. Set to true to use secondary button styling. Defaults to false.
    new_tab: true         # Optional. Set to true to open the link in a new tab. Defaults to false.
```

##### Footer files 

The footer config file referenced in the navigation object defines the footer for the page. It's written in YAML. A footer config file looks like this (`data/example_footer.yaml`): 

```yaml
copyright:                # The copyright info for the footer
  title: 2017 Beanstream  # The text to display for copyright
  link: http://www.beanstream.com/home/ # The destination of the copyright link
left_links:               # The links floated to the left of the footer 
  - link: http://www.beanstream.com/terms-conditions/       # The link path 
    title: 'Terms & Conditions'                             # The link value 
right_links:              # The links floated to the right of the footer
  - link: https://github.com/beanstream/                    # The link path 
    title: Github                                           # The link value
```

##### Table of contents files

The toc config file referenced in the navigation object defines the table of contents for the page. It's written in YAML. A toc config file looks like this (`data/example_toc.yaml`): 

```yaml
- file: '/docs/guides/merchant_quickstart'  # The link 
  title: 'Quickstart: Merchant'
- file: '/docs/guides/partner_quickstart'
  title: 'Quickstart: Partner'
```

If a `title` value in the table of contents config matches a page's frontmatter `title`, the headings from the page will be appended to the table of contents below it's title. 

### Markdown

After the frontmatter configuration, the actual content of pages is defined (for the most part) in markdown. See (here)[http://commonmark.org/help/] for a good overview of the capabilities of markdown. 

The markdown parser ([Redcarpet](https://github.com/vmg/redcarpet)) supports tables formatted like so:

```markdown
| header 1 | header 2 |
| -------- | -------- |
| cell 1   | cell 2   |
| cell 3   | cell 4   |
```

### Layouts

Every page on the site needs to have a layout specified in order to render properly. There are several layouts that are suited to displaying different types of content. 

#### Landing layout

The landing layout serves as the main page of the site. There should only be one page using the landing layout. It consists of a header image, markdown content, and any number of "card sets" serving as quick links to other pages on the site. The landing layout has some additional frontmatter configuration. 

```yaml
---
hero_unit:                                   # Defines the "hero unit" (image, title, tagline) of the page. 
    hero_image: Dev_Portal.jpg                    # The image file to use as a background
    big_heading: Developer Documentation.         # The main page heading 
    tag_line: A tagline.                          # Sits below the big_heading
    button:                                       # Optional. A button displayed under the tag_line. 
        text: Get started                           # The button text. 
        link: /docs/quickstart/                     # The button link.
        
card_sets:                                  # Groups of cards that link to other pages on the site. 
    -
        title: Guides                         # The group title to display
        description: >                        # The description below the title. 
            Learn how to get things done. 
        cards:                                # The cards that make up the card set. Can specify as many as needed. 
            -
                title: Merchant Quickstart        # The cards title 
                description: >
                    Get up and running fast by    # The cards description.  
                    opening a test account.
                icon: flag                        # An icon to display in the top left of the card. 
                link: /docs/setup/                # The href when the card is clicked.
            -
                title: Partner Quickstart
                description: >
                    Get up and running fast by 
                    opening a test account.
                icon: flag
                link: /docs/guides/partner_quickstart/setup/
    -
        title: References                  # A second card set. 
        description: >
            Get an in-depth knowledge of our payment gateway.
        cards:
            -
                title: Payments API
                description: >
                    Our Payments API supports online payments, card tokenization, payment profiles and reporting.
                icon: flag
                link: /docs/references/merchant_API/overview/
---
```

#### Product layout

#### Tutorial layout

#### Spec layout

The spec template uses a tool called [Slate](https://github.com/tripit/slate) to render tabs on the right of the page to display code samples in different languages. You might want to learn about [editing Slate markdown](https://github.com/tripit/slate/wiki/Markdown-Syntax).

#### Swagger layout

#### FAQ layout

## Branching and merging

The site is auto-deployed on pushes to the master branch that build successfully. Changes should first be made and tested on a dedicated development team branch, then pushed to the staging branch, and only staging should ever be pushed to master.

Any branch pushed to the github repo will attempt to build and, if successful, will deploy to an internally accessible s3 bucket with the name dev.beanstream.com.#{branch_name}. These buckets will periodically be deleted but will be recreated if need be when the branch is pushed again (development team base branches will never be deleted).

When development team branches are pushed, Bamboo will try and merge in the master branch before building them and, if successful, will commit the merge back to the development team branch.


## Making non-documentation changes to the site

With a little more effort, larger changes (e.g. adding a new template, changing css styling) can be made to the developer portal.

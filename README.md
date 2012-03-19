# Symphony CMS + Compass + HTML5 Boilerplate + Media queries == Sexy

Version: 2012.02.01b (http://enguindesign.com/journal/articles/2011/07/versioning-revisited/) 

HTML5 Boilerplate Version: 3.0.6

## Overview
This is a revision of the basic Symphony CMS workspace to use Compass/SASS, the HTML5 Boilerplate, and offers basic grids for media queries.

### Features
- Lots of Compass/SASS love.
- Media query love using modernizr with respond.js
- Responsive images using Modernizr.mq and jQuery .attr
- Customized typographic scale using rem with px-based fallback (http://modularscale.com/scale/?px1=16&px2=12&ra1=1.5&ra2=0).
- Customized color scheme based on enguindesign.com (use these at your own peril).
- Basic 6-column grid layouts for 48em and 60em screen widths.
- Extreme minimalist form designs (use these at your peril).

This was created mostly for our own use at Enguin Design, so there are a number of additions and changes to set it up the way we like it. If you'd like a version that is closer to HTML5 Boilerplate, use the branch `compass-h5bp` which leaves out many of the custom styles and additions that appear in this version.

## Requirements

- Compass (http://compass-style.org/)
- Compass H5bp gem (https://github.com/sporkd/compass-h5bp)

## Using this template
After downloading this template, you can drop the whole thing into your Symphony folder. Alternatively, if you are using git. I prefer `git clone` this into its own folder and create a symlink to workspace/ (that way git doesn't get persnickety). Also, should remove `symphony/template` and replace it with a symlink to the `symphony-templates/` folder in this repository, this way you get the updated page.xsl template when creating new pages.

If you are new to Compass–or need a constant reminder like I do–all you have to do is run `compass watch [myproject]` in the command line and compass will watch and update your css files.

I have included mixins for two sets of grids: one set at 48em (768px) and a second set at 60em (960px). I've tried to keep it all documented, and if you want, it is pretty easy to change or update it yourself. I have also included javascript media queries to match the CSS media queries. There is also an example for using jQuery's .attr() method and Symphony's JIT Image Manipulation method for serving responsive images.

Finally, I have not included anything for minimizing your javascript, feel free to do so yourself.

## Changes to HTML5 Boilerplate and Compass-H5bp
This template makes some minor changes to the HTML5 Boilerplate.

- It adds jQuery and jQuery UI, as well the Google Web Font API via the Google Loader.
- A dead simple method of providing responsive images using Modernizr.mq and jQuery's .attr() method. Although this isn't as elegant as a method with server-side optimizations (with cookies), it still works pretty well.

This template makes some pretty major changes to Compass-H5bp.

- Media queries with basic 6 column grid for 769px and 960px screen widths (set using mixins in the _base.scss file.
- Instead of including media queries in the _media.scss partial file, it takes advantage of @media bubbling to nest the media queries for elements together. (http://thesassway.com/intermediate/responsive-web-design-part-2)
- It offers a wider default color palate.
- It changes the way forms are styled, if you want the h5bp basic, you are better off using the compass-h5bp branch
- Element sizes based on rem with px failsafes. (http://snook.ca/archives/html_and_css/font-size-with-rem)

## Templates
The templates in the `symphony-templates/` are meant to replace the files in `/symphony/templates` the main updates are to page.xsl to take advantage of HTML5 elements.

## License
HTML5 Boilerplate created by by Paul Irish and Divya Manian http://html5boilerplate.com
Compass-H5pb by Peter Gumeson https://github.com/sporkd/compass-h5bp

Do what you will. Everything I've created here released with the MIT/X11 license, just like Symphony CMS.
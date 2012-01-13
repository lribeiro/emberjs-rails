EmberJs-Rails
================

Ember.js for Rails 3.1.


Getting started
---------------

* for a more detailed run through see [this blog article](http://sociable.co.nz/post/14789329418/serving-ember-js-with-rails-3-1s-asset-pipeline)

Add the gem to your application Gemfile:

    gem "emberjs-rails"

Run `bundle install`

Change the layout for your views to 'ember' and
you will get the boilerplate html5 layout from the
Ember.js starter kit. In your view you can do:

    <% content_for :title { 'Demo Ember.js Application' }
       content_for :description { 'Demo Ember.js Application from outer space.' }
       content_for :author { 'Demo User <demo@user.com>' } %>

Run `bundle install` and add the following line to 

Rails will serve HandlebarsJS templates to Ember.js
by putting each template in a dedicated ".js.hjs" file
(e.g. `app/assets/javascripts/templates/admin_panel.js.hjs`)
and including the assets in your view:

    <%= javascript_include_tag "templates/admin_panel" %>

By default your view content will be yielded into the document body,
if you want to put your `javascript_include_tag` statements in the
document head then you can wrap it in `content_for :head { ... }`.

You can bundle all templates together thanks to Sprockets,
e.g create `app/assets/javascripts/templates/all.js` with:

    //= require_tree .

Now a single line in the view loads everything:

    <%= javascript_include_tag "templates/all" %>

Feedback
--------

If you have any problems or suggestions please feel free to raise
a Github issue on the [project page](https://github.com/jamesotron/emberjs-rails).

License and Copyright
---------------------

The original `sproutcore-rails` gem is Copyright (C) 2012 [Kisko Labs Oy](http://kiskolabs.com/) and licensed under the MIT license.

My modifications (from commit [21cd52a12f6e91474c4037ac64ec52fc721650b0](https://github.com/jamesotron/emberjs-rails/commit/21cd52a12f6e91474c4037ac64ec52fc721650b0) forward) are Copyright (C) 2012 [Sociable Limited](http://sociable.co.nz/) and licensed under the MIT license.

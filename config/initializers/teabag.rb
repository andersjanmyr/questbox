Teabag.setup do |config|

  # This determines where the Teabag routes will be mounted. Changing this to "/jasmine" would allow you to browse to
  # http://localhost:3000/jasmine to run your specs.
  config.mount_at = "/teabag"

  # This defaults to Rails.root if left nil. If you're testing an engine using a dummy application it can be useful to
  # set this to your engines root.. E.g. `Teabag::Engine.root`
  config.root = nil

  # These paths are appended to the Rails assets paths (relative to config.root), and by default is an array that you
  # can replace or add to.
  config.asset_paths = ["spec/javascripts", "spec/javascripts/stylesheets", "test/javascripts", "test/javascripts/stylesheets"]

  # Fixtures are rendered through a standard controller. This means you can use things like HAML or RABL/JBuilder, etc.
  # to generate fixtures within this path.
  config.fixture_path = "spec/javascripts/fixtures"

  # You can modify the default suite configuration and create new suites here. Suites can be isolated from one another.
  # When defining a suite you can provide a name and a block. If the name is left blank, :default is assumed. You can
  # omit various directives and the defaults will be used.
  #
  # To run a specific suite
  #   - in the browser: http://localhost/teabag/[suite_name]
  #   - from the command line: rake teabag suite=[suite_name]
  config.suite do |suite|

    # You can specify a file matcher and all matching files will be loaded when the suite is run. It's important that
    # these files are serve-able from sprockets.
    #
    # Note: Can also be set to nil.
    suite.matcher = "{spec/javascripts,app/assets}/**/*_spec.{js,js.coffee,coffee}"

    # Each suite can load a different spec helper, which can in turn require additional files. This file is loaded
    # before your specs are loaded, and can be used as a manifest.
    suite.helper = "spec_helper"

    # These are the core Teabag javascripts. It's strongly encouraged to include only the base files here. You can
    # require other support libraries in your spec helper, which allows you to change them without having to restart the
    # server.
    #
    # Available frameworks: teabag-jasmine, teabag-mocha, teabag-qunit
    #
    # Note: To use the CoffeeScript source files use `"teabag/jasmine"` etc.
    suite.javascripts = ["teabag-mocha"]

    # If you want to change how Teabag looks, or include your own stylesheets you can do that here. The default is the
    # stylesheet for the HTML reporter.
    suite.stylesheets = ["teabag"]
  end

  # Example suite. Since we're actually just filtering specs to files already within the root spec/javascripts, these
  # files will also be run in the default suite -- but can be focused into a more specific suite.
  #config.suite :targeted do |suite|
  #  suite.matcher = "spec/javascripts/targeted/*_spec.{js,js.coffee,coffee}"
  #end

  # When Teabag is run via the rake task these configuration directives apply.
  #
  #config.server_timeout = 20 # timeout for starting the server
  #config.driver = "phantomjs" # available: phantomjs, selenium
  #config.formatters = "dot" # available: dot, tap_y, swayze_or_oprah
  #config.fail_fast = true # stop running suites after one has failures
  #config.suppress_log = false # suppress logs coming from console[log/error/debug]

end if defined?(Teabag) && Teabag.respond_to?(:setup) # let Teabag be undefined outside of development/test/asset groups

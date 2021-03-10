require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'jobs/'
  add_filter 'channels/'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  def show_screenshot(width = 640)
    print "\033]1337;File=;inline=1;width=#{width}px:"
    print page.driver.render_base64
    print "\a\n"
  end
end

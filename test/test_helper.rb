require 'rubygems'
require 'test/unit'
require 'active_support'
require 'action_view'
require 'nestive'
require 'stringio'
require_relative '../app/helpers/nestive/layout_helper'

class NestiveHarness
  include Nestive::LayoutHelper
  include ActionView::Helpers::CaptureHelper

  attr_accessor :output_buffer

  def initialize
    @output_buffer = StringIO.new
    super
  end

  def render(opts)
    unless opts == {:file => "layouts/application"}
      raise "NestiveHarness only supports render(:file => 'layouts/application')"
    end

    capture do
      ERB.new("head\n<%= content_for(:head)%>\nfoot").result(binding)
    end
  end

end

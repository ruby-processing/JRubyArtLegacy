require_relative 'test_helper'
require_relative '../lib/rpextras'
require_relative '../lib/jruby_art/helpers/aabb'

Java::Monkstone::JRLibrary.new.load(JRuby.runtime, false)

Dir.chdir(File.dirname(__FILE__))

class MathToolTest < Minitest::Test
  
  def test_aabb_new
    x, y  = 1.0000001, 1.01
    a = Vec2D.new(x, y)
    assert AaBb.new(center: Vec2D.new, extent: a).kind_of?  AaBb
    x0, y0  = -4, -4
    a = Vec2D.new(x0, y0)
    b = a *= -1
    assert AaBb.from_min_max(min: a, max: b).kind_of?  AaBb
    x, y  = 1.0000001, 1.01
    a = AaBb.new(center: Vec2D.new, extent: Vec2D.new(x, y))
    a.position(Vec2D.new(4, 6))
    assert a.center == Vec2D.new(4, 6)
    x, y  = 1.0000001, 1.01
    a = AaBb.new(center: Vec2D.new, extent: Vec2D.new(x, y))
    a.position(Vec2D.new(4, 6)) { false }
    assert a.center == Vec2D.new
  end
end

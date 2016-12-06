class Foo
  def self.new_object(*args)
    instance = allocate
    instance.send(:initialize, *args)
    instance
  end

  def initialize(bar, biz)
    @bar = bar
    @biz = biz
  end
end

Foo.new(1, 2)
Foo.new_object(1, 2)

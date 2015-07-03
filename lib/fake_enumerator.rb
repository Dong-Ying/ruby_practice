class FakeEnumerator
  include FakeEnumerable

  def initialize target, iterator
    @target = target
    @iterator = iterator
  end

  def each &block
  end

  def next
  end

  def with_index
  end

  def rewind
  end
end
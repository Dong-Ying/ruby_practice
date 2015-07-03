require 'sorted_list'
require 'fake_enumerator'

describe FakeEnumerator do
  subject { SortedList.new }

  before do
    subject << 13 << 3 << 4 << 42 << 7
  end

  it "#next" do
    enum = subject.each

    expect(enum.next).to eq(3)
    expect(enum.next).to eq(4)
    expect(enum.next).to eq(7)
    expect(enum.next).to eq(13)
    expect(enum.next).to eq(42)
    expect { enum.next }.to raise_error StopIteration
  end

  it "#rewind" do
    enum = subject.each

    4.times { enum.next }
    enum.rewind

    2.times { enum.next }
    expect(enum.next).to eq 7
  end

  it "#with_index" do
    enum = subject.each

    expected = ["0. 3", "1. 4", "2. 7", "3. 13", "4. 42"]

    actual = enum.map.with_index { |e, i| "#{i}. #{e}" }
    expect(actual).to eq expected
  end
end
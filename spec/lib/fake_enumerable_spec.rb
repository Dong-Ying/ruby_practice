require 'sorted_list'
require 'fake_enumerable'

describe FakeEnumerable do
  subject { SortedList.new }
  before do
    subject << 13 << 3 << 4 << 42 << 7
  end

  it "#map" do
    expect(subject.map { |x| x + 1 }).to eq [4, 5, 8, 14, 43]
  end

  it "#empty?" do
    empty_iter = SortedList.new
    expect(empty_iter.empty?).to eq true
    expect(subject.empty?).to eq false
  end

  it "#first" do
    expect(subject.first).to eq 3
  end

  it "#second" do
    expect(subject.second).to eq 4
  end

  it "#sort_by" do
    expect(subject.sort_by { |x| x.to_s }).to eq [13, 3, 4, 42, 7]
  end

  it "#select" do
    expect(subject.select { |x| x.even? }).to eq [4, 42]
  end

  it "#+" do
    another_iter = SortedList.new
    another_iter << 5 << 6
    expect(subject + another_iter).map eq [ 3, 4, 5, 6, 7, 13, 42 ]
  end

  context "#reduce" do
    it "#given symbol" do
      expect(subject.reduce(:+)).to eq 69
    end

    it "#given initial value and symbol" do
      expect(subject.reduce(-10, :+)).to eq 59
    end

    it "#given block" do
      expect(subject.reduce { |s, e| s + e }).to eq 69
    end

    it "#given initial value and block" do
      expect(subject.reduce(-10) { |s, e| s + e }).to eq 59
    end
  end
end
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Hamster::List do

  [:include?, :member?].each do |method|

    describe "##{method}" do

      [
        [[], "A", false],
        [[], nil, false],
        [["A"], "A", true],
        [["A"], "B", false],
        [["A"], nil, false],
        [["A", "B", nil], "A", true],
        [["A", "B", nil], "B", true],
        [["A", "B", nil], nil, true],
        [["A", "B", nil], "C", false],
      ].each do |values, item, result|

        describe "on #{values.inspect}" do

          list = Hamster.list(*values)

          it "returns #{result}" do
            list.send(method, item).should == result
          end

        end

      end

    end

  end

end

require_relative '../spec_helper_lite'
require_relative '../fixtures/exhibits/nil_exhibit'
require_relative '../../lib/display_case/exhibit'

describe NilExhibit do
  subject        { NilExhibit.new(nil, context) }
  let(:context)  { Object.new }

  it 'says when it is nil' do
    subject.name.must_equal "I am nil!"
  end


  it 'says when it is not nil' do
    not_nil = NilExhibit.new("NotNil!", context)
    not_nil.name.must_equal "I am not nil!"
  end

  describe "what happens in practice" do
    let(:wrapped_nil)  { DisplayCase::Exhibit::Exhibited.new(nil, context) }
    let(:wrapped_obj)  { DisplayCase::Exhibit::Exhibited.new("NotNil!", context) }
    subject { NilExhibit.new(wrapped_nil, context) }

    it 'says when it is nil' do
      subject.name.must_equal "I am nil!"
    end

    it 'says when it is not nil' do
      not_nil = NilExhibit.new(wrapped_obj, context)
      not_nil.name.must_equal "I am not nil!"
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'
require 'puppet/type/typeprovider_myuser'

RSpec.describe 'the typeprovider_myuser type' do
  it 'loads' do
    expect(Puppet::Type.type(:typeprovider_myuser)).not_to be_nil
  end
end

# frozen_string_literal: true

require 'spec_helper'

describe 'typeprovider::myuser' do
  let(:title) { 'namevar' }
  let(:params) do
    {}
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_exec('ensure user: namevar') }
    end
  end
end

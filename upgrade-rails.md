# Upgrade Rails

to_fs


"abc.#{var_a}" => "abc."
"abc.#{var_a}" => Error
"abc.#{var_a}" => "abc" # Money patch 

Date('2025-01-01').to_s => Date('2025-01-01').to_fs
var_date.to_s => Monkey patch
1. var_date => Date/Time/DateTime object
2. var_date => String object
3. var_date => nil


# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActiveModel::TranslationMonkeyPatch do
  let(:dummy_class) do
    Class.new do
      include ActiveModel::Translation
    end
  end

  let(:instance) { dummy_class.new }

  describe '#human_attribute_name' do
    context 'when translation succeeds' do
      before do
        allow(I18n).to receive(:t).and_return('Translated Attribute')
      end

      it 'returns the translated attribute name' do
        expect(instance.human_attribute_name('name')).to eq('Translated Attribute')
      end
    end

    context 'when I18n::InvalidPluralizationData is raised' do
      context 'when attribute ends with a period' do
        before do
          allow(I18n).to receive(:t).and_raise(I18n::InvalidPluralizationData.new('', ''))
          allow(I18n).to receive(:t).with('activerecord.attributes.dummy_class.name', any_args)
                                   .and_return('Translated Name')
        end

        it 'retries with the attribute without the period' do
          expect(instance.human_attribute_name('name.')).to eq('Translated Name')
        end
      end

      context 'when attribute does not end with a period' do
        before do
          allow(I18n).to receive(:t).and_raise(I18n::InvalidPluralizationData.new('', ''))
        end

        it 'returns an empty string' do
          expect(instance.human_attribute_name('name')).to eq('')
        end
      end
    end
  end

  context 'when Rails version is 8.0 or higher' do
    before do
      stub_const('Rails::VERSION::MAJOR', 8)
      stub_const('Rails::VERSION::MINOR', 0)
    end

    it 'raises an error' do
      expect { load 'lib/ext/active_model/translation_monkey_patch.rb' }
        .to raise_error(RuntimeError, 'The issue which this monkey patch is fixing has been fixed in Rails >= 8.0. Please remove this patch.')
    end
  end
end
require 'spec_helper'

describe Reader do
  let(:reader) { Reader.new }

  describe 'validations' do
    before :each do
      @params = {
        email: 'email@mail.com',
        password: 'pass',
        password_confirmation: 'pass'
      }
    end

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }

    it 'is invalid when email is invalid' do
      @params[:email] = nil
      reader = Reader.new(@params)
      expect(reader.valid?).to be_false
    end
  end

  it 'is an ActiveRecord model' do
    expect(Reader.superclass).to eq(ActiveRecord::Base)
  end

  it 'has email' do
    reader.email = 'email@mail.com'
    expect(reader.email).to eq('email@mail.com')
  end

  it 'responds to password' do
    reader.password = 'pass'
    expect(reader.password).to eq('pass')
  end

  it 'responds to password_confirmation' do
    reader.password_confirmation = 'pass'
    expect(reader.password_confirmation).to eq('pass')
  end
end

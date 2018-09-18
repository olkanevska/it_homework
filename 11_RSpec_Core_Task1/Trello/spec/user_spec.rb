require_relative "../user"
require_relative "../board"
require 'faker'

describe User do
  describe ".new" do
    before do
      @user = User.new
    end
    it 'create new user' do
      expect(@user).to be_an_instance_of(User)
    end
  end
  describe "#add_board" do
    before do
      @user = User.new
      @board = @user.add_board("car")
    end
    it 'user add board' do
      expect(@user.boards).to include @board
    end
  end
  describe "#rename_board" do
    before do
      @user = User.new
      @board = @user.add_board("car")
    end
    it 'user add board' do
      expect(@user.rename_board(@board, "avto")).to eql("avto")
    end
  end
end
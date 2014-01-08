# encoding: UTF-8

require 'spec_helper'

describe TheRole::Param do
  it 'module TheRole::Param should be defined' do
    TheRole::Param.class.should be Module
  end

  it 'string process 1' do
    TheRole::Param.process('hello world!').should eq 'hello_world'
  end

  it 'string process 2' do
    TheRole::Param.process(:hello_world!).should eq 'hello_world'
  end

  it 'string process 3' do
    TheRole::Param.process("hello !      world").should eq 'hello_world'
  end

  it 'string process 4' do
    TheRole::Param.process("HELLO  $!= WorlD").should eq 'hello_world'
  end

  it 'string process 5' do
    TheRole::Param.process("HELLO---WorlD").should eq 'hello_world'
  end

  it "should work with Controller Name" do
    ctrl = PagesController.new
    ctrl.controller_path

    TheRole::Param.process(ctrl.controller_path).should eq 'pages'
  end

  it "should work with Nested Controller Name" do
    class Admin::PagesController < ApplicationController;
    end
    ctrl = Admin::PagesController.new
    ctrl.controller_path

    TheRole::Param.process(ctrl.controller_path).should eq 'admin_pages'
  end
end
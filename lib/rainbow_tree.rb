# frozen_string_literal: true

require "rainbow_tree/version"
require "rainbow_tree/engine"
require "rainbow_tree/root_node"
require "rainbow_tree/tree_node"
require "rainbow_tree/tree_node_configuration"

module RainbowTree
  def self.included(base)
    base.extend(ClassMethods)
  end
end

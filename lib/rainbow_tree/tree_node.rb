# frozen_string_literal: true

module RainbowTree
  module TreeNode
    extend ActiveSupport::Concern

    # @return [RainbowTree::TreeNodeConfiguration] The configuration for this node class
    attr_reader :config

    included do
      unless respond_to?(:top)
        # @return [ActiveRecord::Relation] The top nodes
        scope :top, -> { config.top_scope_for(self) }
      end

      unless respond_to?(:sorted)
        # @return [ActiveRecord::Relation] The sorted nodes
        scope :sorted, -> { config.sorted_scope_for(self) }
      end

      unless method_defined?(:depth)
        # @return [Integer] The depth of the node
        define_method :depth do
          config.depth_method_for(self)
        end
      end
    end

    class_methods do
      # Configuration for a RainbowTree::TreeNode
      #
      # @param parent_relation [Symbol] The name of the parent relation
      # @param children_relation [Symbol] The name of the children relation
      # @param position_key [Symbol] The name of the position key
      # @param options [Hash] The options hash
      # @option options [Symbol] :top_scope The name of the top scope
      # @option options [Symbol] :sorted_scope The name of the sorted scope
      # @option options [Symbol] :depth_method The name of the depth method
      # @option options [Symbol] :root_relation The name of the root relation
      # @return [void]
      def rainbow_tree(parent_relation:, children_relations:, position_key:, **)
        @config = TreeNodeConfiguration.new(
          parent_relation: parent_relation,
          children_relations: children_relations,
          position_key: position_key,
          **
        )

        nil
      end
    end
  end
end

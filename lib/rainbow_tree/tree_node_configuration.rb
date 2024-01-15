# frozen_string_literal: true

module RainbowTree
  class TreeNodeConfiguration
    attr_reader :parent_relation,
                :children_relations,
                :position_key,
                :top_scope,
                :sorted_scope,
                :depth_method,
                :root_relation

    # Configuration for a RainbowTree::TreeNode
    #
    # @param parent_relation [Symbol] The name of the parent relation
    # @param children_relations [Array<Symbol>] The name of the children relations
    # @param position_key [Symbol] The name of the position key
    # @param options [Hash] The options hash
    # @option options [Symbol] :top_scope The name of the top scope
    # @option options [Symbol] :sorted_scope The name of the sorted scope
    # @option options [Symbol] :depth_method The name of the depth method
    # @option options [Symbol] :root_relation The name of the root relation
    def initialize(parent_relation:, children_relations:, position_key:, **options)
      @parent_relation = parent_relation
      @children_relations = children_relations.is_a?(Array) ? children_relations : [children_relations]
      @position_key = position_key
      @top_scope = options.fetch(:top_scope, :top)
      @sorted_scope = options.fetch(:sorted_scope, :sorted)
      @depth_method = options.fetch(:depth_method, :depth)
      @root_relation = options.fetch(:root_relation, @parent_relation)
    end

    # @param node [ActiveRecord::Base] The node
    # @return [ActiveRecord::Base] The parent of the node
    def parent_for(node)
      node.send(@parent_relation)
    end

    # @param node [ActiveRecord::Base] The node
    # @return [ActiveRecord::Relation] The children of the node
    def children_for(node)
      node.send(@children_relation)
    end

    # @param node [ActiveRecord::Base] The node
    # @return [Integer] The position of the node
    def position_for(node)
      node.send(@position_key)
    end

    # @param node [ActiveRecord::Base] The node
    # @return [ActiveRecord::Relation] The top nodes
    def top_scope_for(node)
      node.class.send(@top_scope)
    end

    # @param node [ActiveRecord::Base] The node
    # @return [ActiveRecord::Relation] The sorted nodes
    def sorted_scope_for(node)
      node.class.send(@sorted_scope)
    end

    # @param node [ActiveRecord::Base] The node
    # @return [Integer] The depth of the node
    def depth_for(node)
      node.send(@depth_method)
    end
  end
end

# frozen_string_literal: true

module Rounder
  def self.ceil_to_nearest(value, step)
    (value / step).ceil * step
  end
end

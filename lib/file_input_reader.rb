# frozen_string_literal: true

class FileInputReader
  def self.parse(file_path)
    File.readlines(file_path).map(&:strip)
  end
end

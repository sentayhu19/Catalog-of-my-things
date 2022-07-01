module InputData
    def self.get_genre_label_author(genre_manager, label_manager)
      label = label_manager.select_label
      [label]
    end
  end
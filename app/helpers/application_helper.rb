module ApplicationHelper
  def crasherimage(room)
    if room.crushpoint < 50
      image_tag ("crusher.png"), :class => "crusher-image"
    else
      image_tag ("crusher-over.png"), :class => "crusher-image"
    end
  end

  def kakoiimage(room)
    if room.kakoipoint < 50 
      image_tag ("kakoi.png"), :class => "crusher-image"
    else
      image_tag ("kakoi-over.png"), :class => "crusher-image"
    end
  end
end

module SenseHatAPI
  WHITE = [255, 255, 255]
  BLACK = [0, 0, 0]
  
  class SenseHat
    def initialize(framebuffer='/dev/fb1')
    end
    
    def set_rotation(r, redraw = true)
    end
    alias_method :rotation=, :set_rotation

    def  flip_h(redraw=true)
    end
    
    def  flip_v(redraw=true)
    end

    def set_pixels(pixel_list)
    end
    alias_method :pixels=, :set_pixels

    def get_pixels
    end
    alias_method :pixels, :get_pixels

    def set_pixel(x, y, *rgb)
      rgb = rgb.first if rgb.first.is_a? Array
    end

    def get_pixel(x, y)
    end

    def load_image(file_path, redraw=true)
    end

    def clear(*rgb)
      rgb = BLACK if rgb.empty?
      rgb = rgb.first if rgb.first.is_a? Array
    end

    def show_message(text_string, scroll_speed=0.1, text_colour=WHITE, back_colour=BLACK)
    end

    def show_letter(s, text_colour=WHITE, back_colour=BLACK)
    end

    def low_light=(b)
    end

    def gamma=(g)
    end

    def gamma_reset
    end

    
  end
end

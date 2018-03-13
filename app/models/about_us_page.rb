class AboutUsPage < Fae::StaticPage

  @slug = 'about_us'

  # required to set the has_one associations, Fae::StaticPage will build these associations dynamically
  def self.fae_fields
    {
      hero_image: { type: Fae::Image },
      headline: { type: Fae::TextField },
      body: { type: Fae::TextArea }
    }
  end

end

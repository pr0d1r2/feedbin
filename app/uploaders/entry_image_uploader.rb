class EntryImageUploader < CarrierWave::Uploader::Base

  storage :fog

  def store_dir
    "public-images/#{Time.now.utc.strftime("%F")}"
  end

  def fog_attributes
    {
      "Cache-Control" => "max-age=315360000, public",
      "Expires" => 20.years.from_now.httpdate
    }
  end

end

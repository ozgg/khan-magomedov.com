# frozen_string_literal: true

# Uploader for simple images
class SimpleImageUploader < Shrine
  plugin :derivatives, create_on_promote: true
  plugin :instrumentation
  plugin :store_dimensions

  Attacher.validate do
    validate_max_size 16_777_216, message: ->(max) { [:too_large, { max: }] }
    validate_mime_type %w[image/jpeg image/webp image/png]
  end

  Attacher.derivatives do |original|
    vips = ImageProcessing::Vips.source(original)

    {
      hd: vips.resize_to_fit(1920, 1080),
      large: vips.resize_to_fit(1280, 720),
      medium: vips.resize_to_fit(640, 360),
      small: vips.resize_to_fit(320, 180),
      thumbnail: vips.resize_to_fit(160, 90)
    }
  end

  def generate_location(io, record: nil, derivative: nil, **)
    return super unless record

    uuid = record.uuid.to_s
    table = record.class.table_name
    id = "#{uuid[0..2]}/#{uuid[3..5]}/#{uuid[6..7]}"
    prefix = derivative || 'original'

    "uploads/#{table}/#{id}/#{prefix}-#{super}"
  end
end

from ImageGoNord import NordPaletteFile, GoNord

# E.g. Replace pixel by pixel
go_nord = GoNord()
go_nord.enable_avg_algorithm()
go_nord.reset_palette()
go_nord.add_file_to_palette(NordPaletteFile.POLAR_NIGHT)
go_nord.add_file_to_palette(NordPaletteFile.SNOW_STORM)
image = go_nord.open_image("./dark_gundam_ibo_02.jpg")
go_nord.convert_image(image, save_path='../wallpapers_nord/nord_gundam_barbatos.test.png')

# # E.g. Avg algorithm and less colors
#
# image = go_nord.open_image("images/test.jpg")
# go_nord.convert_image(image, save_path='images/test.avg.jpg')
#
# # E.g. Resized img no Avg algorithm and less colors
# go_nord.disable_avg_algorithm()
# go_nord.reset_palette()
# go_nord.add_file_to_palette(NordPaletteFile.POLAR_NIGHT)
# go_nord.add_file_to_palette(NordPaletteFile.SNOW_STORM)
#
# image = go_nord.open_image("images/test.jpg")
# resized_img = go_nord.resize_image(image)
# go_nord.convert_image(resized_img, save_path='images/test.resized.jpg')
#
# # E.g. Quantize
#
# image = go_nord.open_image("images/test.jpg")
# go_nord.reset_palette()
# go_nord.set_default_nord_palette()
# quantize_image = go_nord.quantize_image(image, save_path='images/test.quantize.jpg')
#
# # To base64
# go_nord.image_to_base64(quantize_image, 'jpeg')

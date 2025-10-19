import replicate


with open("dialogue.txt", "r", encoding="utf-8") as f:
    dialogue_text = f.read()

prompt = f"Generate an image for a manga style based on the following dialogue: {dialogue_text}"
output = replicate.run(
    "google/nano-banana",
    input={
        "prompt": prompt,
        "output_format": "jpg"
    }
)

# To access the file URL:
#print(output.url())
#=> "http://example.com"

# To write the file to disk:
with open("my-image.png", "wb") as file:
    file.write(output.read())
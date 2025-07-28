from sentence_transformers import SentenceTransformer

# Define the path where you want to save the model
local_model_path = "./all-MiniLM-L6-v2-local"

# Load the model (it will download if not already cached)
model = SentenceTransformer('sentence-transformers/all-MiniLM-L6-v2')

# Save the model to your specified local path
model.save(local_model_path)

print(f"Model 'all-MiniLM-L6-v2' downloaded and saved to: {local_model_path}")
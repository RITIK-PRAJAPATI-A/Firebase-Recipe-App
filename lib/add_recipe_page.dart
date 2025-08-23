import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddRecipePage extends StatefulWidget {
  // Add optional properties to receive existing recipe data for editing
  final String? recipeId;
  final Map<String, dynamic>? initialData;

  const AddRecipePage({super.key, this.recipeId, this.initialData});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _titleController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Check if we are in "edit mode"
  bool get isEditing => widget.recipeId != null;

  @override
  void initState() {
    super.initState();
    // If we are editing, pre-fill the text fields
    if (widget.initialData != null) {
      _titleController.text = widget.initialData!['title'] ?? '';
      _ingredientsController.text = widget.initialData!['ingredients'] ?? '';
      _instructionsController.text = widget.initialData!['instructions'] ?? '';
      _imageUrlController.text = widget.initialData!['imageUrl'] ?? '';
    }
  }

  // This function now handles both creating and updating
  Future<void> _saveRecipe() async {
    if (_formKey.currentState!.validate()) {
      try {
        final recipeData = {
          'title': _titleController.text,
          'ingredients': _ingredientsController.text,
          'instructions': _instructionsController.text,
          'imageUrl': _imageUrlController.text,
        };

        if (isEditing) {
          // If editing, update the existing document
          await FirebaseFirestore.instance
              .collection('recipes')
              .doc(widget.recipeId)
              .update(recipeData);
        } else {
          // If creating, add a new document
          await FirebaseFirestore.instance.collection('recipes').add(recipeData);
        }

        if (mounted) {
          // Go back twice if editing (details -> home), once if creating (form -> home)
          Navigator.pop(context);
          if (isEditing) {
            Navigator.pop(context);
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save recipe: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Show a different title depending on if we are creating or editing
        title: Text(isEditing ? 'Edit Recipe' : 'Add New Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Form fields are the same as before
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ingredientsController,
                decoration: const InputDecoration(labelText: 'Ingredients'),
                maxLines: 5,
                validator: (value) => value!.isEmpty ? 'Please enter ingredients' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _instructionsController,
                decoration: const InputDecoration(labelText: 'Instructions'),
                maxLines: 8,
                validator: (value) => value!.isEmpty ? 'Please enter instructions' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
                validator: (value) => value!.isEmpty ? 'Please enter an image URL' : null,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveRecipe,
                child: const Text('Save Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
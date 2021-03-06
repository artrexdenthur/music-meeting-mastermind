# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project - Self Explanatory
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - User has_many Choruses
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - Singer has_many Choruses through Memberships, and vice-versa
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - See above
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - (implement in forms) A singer has a part in a chorus that is determined by the membership
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - Needs implementation. Choruses can be scoped to each voice part.
- [x] Include signup (how e.g. Devise) - Devise
- [x] Include login (how e.g. Devise) - Devise
- [x] Include logout (how e.g. Devise) - Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Devise/OmniAuth Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - users/x/choruses
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - Create new chorus
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - flash me up baby

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate

Other Steps:
- [ ] Record a 30min coding session
- [ ] Write a README.md
- [ ] Submit a user guide video
- [ ] Write a blog post about the project and process

# TODO list for site project

## Objective

`site` will be a web app for hosting photos and blog posts

## MVP scope
### Endpoints
- Individual image view
    - Page displaying individual images
        - With annotations
        - With tags
        - With exif metadata
- Image gallery view
    - Paginated view showing images in an album
    - Paginated view showing images with one or more tags
- Top page
    - Shows list of albums and tags

### Tooling
- Tooling to upload photos and metadata
    - Should create thumbnails
- Tooling to create albums

### Aesthetic considerations
- No javascript, stateless frontend with server-side rendering
- RESTful
    - Any public area of site can be reached by following hyperlinks from any other public area of the site
- Looks "old"
- Annotations and other content should support some flavor of markdown

## Post-MVP scope
- Usage analytics
- Private galleries
    - Scope TBD
    - Ability to flag images as public or hidden
        - Hidden images do not show up in search and can only be accessed through albums
- Blog post viewer
    - Scope TBD

# Technical architecture

## Image metadata storage
TBD - Relational DB?

## Hosting
TBD - EC2?



# TODO list for site project

## Objective

`site` will be a web app for hosting photos

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
- Caching layer
- Private galleries
    - Scope TBD
    - Ability to flag images as public or hidden
        - Hidden images do not show up in search and can only be accessed through albums
- Blog post viewer
    - Scope TBD
- Album tagging?

# Domain objects

## Photo
A Photo represents an individual photo and has the following properties:
- Original file name
- Name?
    - Do not know if want
- Description
    - Text explaining image
- Image content
    - Thumbnail size
    - Normal (1080p?) size
    - Full size
- Exif metadata
- Tags
- Hidden-ness
    - If true, treat as if it does not exist
- Creation timestamp
- Import timestamp


## Album

An Album represents a grouping of several related photos and has the following properties:
- Name
- Description
- List of photos
    - Does this need to be an ordered list?
- Cover photo
- Hidden-ness
    - If true, treat as if it does not exist
- Creation timestamp

## Tag

A Tag represents an arbitrary property of a Photo and has the following properties
- Name
- Hidden-ness

# Endpoints

## Home

Should show a list of albums with their descriptions and cover photos, most recently added first.


# Technical architecture

## Server
Go application

Gorilla mux?

## Image metadata storage
TBD - Relational DB?

How to do migrations?

## Tooling
???

## Testing, CI
Github actions?

Tests
Linter(s)

## Hosting
Dev phase: lxc container or similar

Production:
TBD - EC2?
Do you need a CDN?

## Deployment
???
scp for starters


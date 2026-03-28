# TODO list for site project

## Objective

`site` will be a simple web app for hosting photos and photo albums.

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
- Additional metadata for film photos
    - Camera
    - Film type
    - ISO
- Film vs digital label

Unclear how to link db content to photos on disk/CDN. Is storing URIs a wise practice?

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
    - No special characters
    - No spaces
- Hidden-ness

# Endpoints

## Home

Path: `/`

Should show a list of albums with their descriptions and cover photos, most recently added first.

## Photo view

Path: `/photo/{photo_id}`

Should show a single photo in the context of an album. Should use medium resolution image and show image metadata as well. Should display a link to full resolution image file.

## Album view

Path: `/album/{id}/photos`
Path: `/album/{id}/page/{page_num}/photos` ???

Should show a list of photos in the album with id `{id}` ordered by creation timestamp. Should be paginated if there are more than 100 (TBD) photos in the list???

## Album photo view

*TBD: Do we actually want this?*

Path: `/album/{album_id}/photo/{photo_id}`

As photo view, but should also provide links to next and previous photos in album.

## Tag view

Path: `/tag/{tag_name}/photos`

Should show a list of photos with the tag `{tag_name}` ordered by creation timestamp, newest first.

Maybe this needs pagination?

## Tag photo view

*TBD: Do we actually want this?*

Path: `/tag/{tag_name}/photo/{photo_id}`

As photo view, but should also provide links to next and previous photos in parent tag view.

# Technical architecture

## Server
Go application

Gorilla mux?

## Configuration
Environment variables

## Image metadata storage
This is the layer responsible for storing image metadata, tags, albums, etc.
### Database
Postgresql
- Migrations via https://github.com/pressly/goose
- Driver via https://github.com/jackc/pgx

## Static content storage
This is the layer responsible for storing content such as image files, thumbnails, css, etc.

For MVP phase, will use plain file directory server via Go. Closer to production, consider using CDN or something else.

## Testing, CI
CI will use Github Actions

CI should do the following:
- Run all tests
- Run all linter(s)
    - TBD: decide what linters should be used

## Hosting
Dev phase:
- LXC container or similar
- Postgres in LXC container

Production:
- TBD - EC2?
- Do you need a CDN?

## Deployment
???
scp for starters?


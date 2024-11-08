# Storystream Conversion Metrics
A GTM tag to install that allows your StoryStream module to measure conversions

- Log in to your workspace on Tag Manager
- Click Templates on the left hand menu
- Click New on the right hand side
- Click the three dots top right - "import"
- Load the .tpl file that is part of this repository
- Save this
- Now go back to your workspace and click "Tags" in the left hand menu
- Click New
- Click Tag configuration
- Choose "StoryStream Conversion Metric" in the "Custom" section of the "Choose tag type" menu
- Add your story id to the field
- Set up the trigger to be your standard purchase event. 
- Currently this is GA4 only, so it's likely the trigger needs to be a "Custom Event" and it should be named "purchase"
- Press Save
- Then press Submit so your workspace is saved and deployed with the new tag


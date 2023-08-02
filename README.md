<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/github_username/repo_name">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">project_title</h3>

  <p align="center">
    project_description
    <br />
    <a href="https://github.com/github_username/repo_name"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/github_username/repo_name">View Demo</a>
    ·
    <a href="https://github.com/github_username/repo_name/issues">Report Bug</a>
    ·
    <a href="https://github.com/github_username/repo_name/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

Here's a blank template to get started: To avoid retyping too much info. Do a search and replace with your text editor for the following: `github_username`, `repo_name`, `twitter_handle`, `linkedin_username`, `email_client`, `email`, `project_title`, `project_description`


Project Link: [https://github.com/github_username/repo_name](https://github.com/github_username/repo_name)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Ruby][Ruby]][Ruby-url]
* [![Rails][Rails]][Rails-url]
* [![Tailwind][Tailwind]][Tailwind-url]
* [![Postgres][Postgres]][Postgres-url]
* [![Render][Render]][Render-url]
* [![Heroku][Heroku]][Heroku-url]
* [![CircleCI][CircleCI]][CircleCI-url]

CivicVoicePlus uses these integrations:
* [LegiScan](https://legiscan.com/)
* [OpenStates](https://open.pluralpolicy.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To demo CivicVoicePlus on your local machine, follow these steps:

### Back End Repository
1. Get a free LegiScan API key [here](https://legiscan.com/user/register)
1. Get a free OpenStates API key [here](https://open.pluralpolicy.com/accounts/signup/)
1. Clone this repo `git@github.com:jcjurado3/civic_voice_plus_be.git`
1. Navigate to the local repository: `cd civic_voice_plus_be`
1. Run: `bundle install`
1. Run: `rails db:{create,migrate}`
1. Run: `bundle exec figaro install`
1. Add `LEGISCAN_KEY` and `STATES_KEY` to `config/application.yml` file
1. Run: `rails s` to start Rails server
1. Visit: http://localhost:3000/

### Front End Repository
1. Clone the front end [here](https://github.com/jcjurado3/civic_voice_plus_fe)
1. Follow instuctions in the front end repo `README`


### Prerequisites

* ruby 3.2.2
* Rails Version 7.0.6

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Testing

`bundle exec rspec` will run the entire test suite. *All tests passing at time of writing.*
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DB Design -->
## DB Design
![database design](<CVP db design.png>)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Endpoints -->
## Endpoints
<details>
<summary>GET <code>/api/v1/bills?state=''&query=''</code></summary>
<br>

    {
      "data": [
        {
        "id": "0",
        "type": "bill",
        "attributes": {
            "state": "FL",
            "bill_number": "H1234",
            "bill_id": 1234567,
            "text_url": "https://legiscan.com/FL/text/H1234/2023",
            "last_action_date": "2023-07-07",
            "last_action": "Chapter No. 2023-123",
            "title": "HealthCare District Chapter, Healthcare",
            "status": null,
            "description": null,
            "sponsors": null,
            "texts": null
            }
        }, ...]}


</details>
<br>
<details>
<summary>GET <code>/api/v1/bills/id</code></summary>
<br>

    {
      "data": {
        "id": "1722281",
        "type": "bill",
        "attributes": {
            "state": "FL",
            "bill_number": "H1234",
            "bill_id": 1234567,
            "text_url": null,
            "last_action_date": null,
            "last_action": null,
            "title": "HealthCare District Chapter, Healthcare",
            "status": 4,
            "description": "simple description of bill.",
            "sponsors": [
                {
                "people_id": 2345,
                "name": "Taylor Doe",
                "first_name": "Taylor",
                "last_name": "Doe",
                "ballotpedia": "Taylor_Doe"
                }, ...],
            "texts": [
                {
                "doc_id": 3456789,
                "url": "https://legiscan.com/FL/text/H1234/id/3456789"
                }, ...]
        }
      }
    }

</details>
<br>
<details>
<summary>GET <code>/api/v1/user_bills?user_id=''</code></summary>
<br>

    {
      "data": [{
        "id": "1722281",
        "type": "bill",
        "attributes": {
            "state": "FL",
            "bill_number": "H1234",
            "bill_id": 1234567,
            "text_url": null,
            "last_action_date": null,
            "last_action": null,
            "title": "HealthCare District Chapter, Healthcare",
            "status": 4,
            "description": "simple description of bill.",
            "sponsors": [
                {
                "people_id": 2345,
                "name": "Taylor Doe",
                "first_name": "Taylor",
                "last_name": "Doe",
                "ballotpedia": "Taylor_Doe"
                }, ...],
            "texts": [
                {
                "doc_id": 3456789,
                "url": "https://legiscan.com/FL/text/H1234/id/3456789"
                }, ...]
        }
      }]
    }


</details>
<br>

<details>
<summary>GET <code>/api/v1/user_categories?user_id=''</code></summary>
<br>

    {
      data: [
        {
          id: "1",
          type: "category",
          attributes: {
            :name=>"artificial intelligence"
            }
        },
        {
          id: "2",
          type: "category",
          attributes: {
            :name=>"climate"
            }
        }
      ]
    }


</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Technical Solutions -->
## Technical Solutions:
As part of the Consultancy project requirements, the CivicVoicePlus team challenged ourselves to implement three stretch technologies during the 11-day design and development process. We selected these technologies based on the challenges we anticipated facing while building out our MVP, and adjusted our choices to reflect our individual and team learning goals as well as blockers that came up during the course of working on the project.

### Caching
* Challenge: Two of the API endpoints that expose data for the front end of our application rely on both database queries and external API calls, which significantly slowed down the processing time and resulted in a less-than-ideal experience for our users. Additionally, we were hitting rate limits on our API endpoints.
* Solution: We decided cache our bill endpoints and save bills to our database since this is frequent endpoints and there are so many bills to render on both a users dashboard as well as bills show pages. We used the Rails.cache syntax and some helpful documentation to cache these requests on the back end. We decided not to implement caching for other API calls that would change frequently, such as the request to get all saved bills for a specific user.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Roadmap -->
## Roadmap
Additional features, functionality, and potential refactors:
  * Consume additional APIs to allow users to find nearest polling/voting stations and dates
  * Allow users to create custom search parameters to render on their user digest
  * Create functionality to allow users to opt into email or push notification on status updates of their saved bills
  * Consume OpenAI API and add functionality to a bills show page to read and summarize the entire bill's text document
  * Additional back end database validations

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Project Contributor Contact Info
* Ashley Plasket: [![Linkedin][Linkedin-shield]][ashley-li-url] [![Github][Github]][ashley-gh-url]
* Jeff Redish:   [![Linkedin][Linkedin-shield]][jeff-li-url] [![Github][Github]][jeff-gh-url]
* Jimmy Jurado [![Linkedin][Linkedin-shield]][jimmy-li-url] [![Github][Github]][jimmy-gh-url]
* Julian Beldotti [![Linkedin][Linkedin-shield]][julian-li-url] [![Github][Github]][julian-gh-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/jcjurado3/civic_voice_plus_be.svg?style=for-the-badge
[contributors-url]: https://github.com/jcjurado3/civic_voice_plus_be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/jcjurado3/civic_voice_plus_be.svg?style=for-the-badge
[forks-url]: https://github.com/jcjurado3/civic_voice_plus_be/network/members
[stars-shield]: https://img.shields.io/github/stars/jcjurado3/civic_voice_plus_be.svg?style=for-the-badge
[stars-url]: https://github.com/jcjurado3/civic_voice_plus_be/stargazers
[issues-shield]: https://img.shields.io/github/issues/jcjurado3/civic_voice_plus_be.svg?style=for-the-badge
[issues-url]: https://github.com/jcjurado3/civic_voice_plus_be/issues
[license-shield]: https://img.shields.io/github/license/jcjurado3/civic_voice_plus_be.svg?style=for-the-badge
[license-url]: https://github.com/jcjurado3/civic_voice_plus_be/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[ashley-li-url]: https://www.linkedin.com/in/ashley-plasket/
[jeff-li-url]: https://www.linkedin.com/in/jredish/
[jimmy-li-url]: https://www.linkedin.com/in/jimmy-jurado-093568131/
[julian-li-url]: https://www.linkedin.com/in/julian-beldotti-1a427824/
[Github]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[project-be-gh-url]: https://github.com/jcjurado3/civic_voice_plus_fe
[project-fe-gh-url]: https://github.com/jcjurado3/civic_voice_plus_be
[ashley-gh-url]: https://github.com/aplasket
[jeff-gh-url]: https://github.com/Jredish11
[jimmy-gh-url]: https://github.com/jcjurado3
[julian-gh-url]: https://github.com/JCBeldo
[Ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/en/
[Tailwind]: https://img.shields.io/badge/Tailwind-191970?style=for-the-badge&logo=tailwindcss&logoColor=white
[Tailwind-url]: https://tailwindcss.com/
[Rails]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/
[Postgres]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
[UnSplash]: https://img.shields.io/badge/Unsplash-C0C0C0?style=for-the-badge&logo=unsplash&logoColor=white
[UnSplash-url]: https://unsplash.com/
[Render]: https://img.shields.io/badge/Render-1E90FF?style=for-the-badge&logo=render&logoColor=white
[Render-url]: https://render.com/
[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://devcenter.heroku.com/articles/getting-started-with-rails7
[CircleCI]: https://img.shields.io/badge/circleci-343434?style=for-the-badge&logo=circleci&logoColor=white
[CircleCI-url]: https://circleci.com/
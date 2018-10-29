# emoji
This Project has been built on Amazon EC2(Free Tier) instance.

The added files and its details are :
1) build.zip :- This is zipped file of package created ,which can be bundled and used to deploy to desired environments.
2) emoji_deploy.sh :- This is the script used to create package of emoji project and deploy/run, which brings up the emoji-search application on port# 3000 at             URL http://13.233.80.216:3000/

Jenkins has been used as CI-CD tool to build and deploy emoji-search application on dev environment, after fetching the code from Git Repository provided.

Jenkins URL :- http://ec2-13-233-80-216.ap-south-1.compute.amazonaws.com:8080/job/ahfarmer_test/
Credentials to login and run the job:
Username: kashish
Password: kashish

Security consideration is taken care by:
1) Securing the Jenkins Job giving limited access to the job
2) EC2 instance is created by ensuring secured connection by generating key-value pair.

The Job is configured to adhere to CI-CD by triggerring periodic build/deploy every 6 hours as suggested.

The Project was built in a considerably less time,due to limited resources available
Had there been more time and resource, following things could be worked upon:
1) Containerization using docker with aws.
2) Could have tried to deploy this on a different webserver.
3) Could have deployed the build package on GitHub Repo using "npm run deploy"
4) Also could implement monitoring of the server using Cloutwatch.

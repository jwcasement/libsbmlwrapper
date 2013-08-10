\name{select_from_Event}
\alias{select_from_Event}
\title{Select _p_Event sub-components}
\usage{
  select_from_Event(x, i)
}
\arguments{
  \item{x}{a _p_Event object}

  \item{i}{a string which should be "Trigger", "Delay",
  "Priority", "ListOfEventAssignments", "EventAssignment"or
  an Event attribute}
}
\value{
  an object of class R_ListOfEventAssignments, _p_Trigger,
  _p_Delay, _p_Priority or a call to
  \code{get_attribute_from_component}
}
\description{
  select_from_Event
}
\details{
  Handles requests for sub-components from a _p_Event
  object
}


# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# load an SBML file
data(enzymaticreaction)

# create a _p_SBMLDocument object
doc = readSBMLFromString(enzymaticreaction)

# now create a _p_Model object
mod = SBMLDocument_getModel(doc)

# no history will be added if there is no metaid to reference,
# so set a metaId if not already set
if (!SBase_isSetMetaId(mod))
  SBase_setMetaId(mod, "___model2501");


model_history_annotation = paste(
  "<annotation>\n",
  "  <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:dcterms=\"http://purl.org/dc/terms/\" xmlns:vCard=\"http://www.w3.org/2001/vcard-rdf/3.0#\" xmlns:bqbiol=\"http://biomodels.net/biology-qualifiers/\" xmlns:bqmodel=\"http://biomodels.net/model-qualifiers/\">\n",
  "    <rdf:Description rdf:about=\"#", SBase_getMetaId(mod), "\">\n",
  "      <dc:creator rdf:parseType=\"Resource\">\n",
  "        <rdf:Bag>\n",
  "          <rdf:li rdf:parseType=\"Resource\">\n",
  "            <vCard:N rdf:parseType=\"Resource\">\n",
  "              <vCard:Family>Keating</vCard:Family>\n",
  "              <vCard:Given>Sarah</vCard:Given>\n",
  "            </vCard:N>\n",
  "            <vCard:EMAIL>sbml-team@caltech.edu</vCard:EMAIL>\n",
  "            <vCard:ORG>\n",
  "              <vCard:Orgname>University of Hertfordshire</vCard:Orgname>\n",
  "            </vCard:ORG>\n",
  "          </rdf:li>\n",
  "        </rdf:Bag>\n",
  "      </dc:creator>\n",
  "      <dcterms:created rdf:parseType=\"Resource\">\n",
  "        <dcterms:W3CDTF>1999-11-13T06:54:32Z</dcterms:W3CDTF>\n",
  "      </dcterms:created>\n",
  "      <dcterms:modified rdf:parseType=\"Resource\">\n",
  "        <dcterms:W3CDTF>2007-11-31T06:54:00-02:00</dcterms:W3CDTF>\n",
  "      </dcterms:modified>\n",
  "    </rdf:Description>\n",
  "  </rdf:RDF>\n",
  "</annotation>\n",
  sep = "");

SBase_appendAnnotation(mod, model_history_annotation);

#
# The above code can be replaced by the code in addModelHistory.R
#

# get a _p_Species object from the model
s = Model_getSpecies(mod, 0);

# no CV terms will be added if there is no metaid to reference,
# so set a metaId if not already set
if (!SBase_isSetMetaId(s))
  SBase_setMetaId(s, "___species2501");

cvterms_annotation = paste("<annotation>\n",
                           "  <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:dcterms=\"http://purl.org/dc/terms/\" xmlns:vCard=\"http://www.w3.org/2001/vcard-rdf/3.0#\" xmlns:bqbiol=\"http://biomodels.net/biology-qualifiers/\" xmlns:bqmodel=\"http://biomodels.net/model-qualifiers/\">\n",
                           "    <rdf:Description rdf:about=\"#", SBase_getMetaId(s) , "\">\n",
                           "      <bqbiol:isVersionOf>\n",
                           "        <rdf:Bag>\n",
                           "          <rdf:li rdf:resource=\"http://www.geneontology.org/#GO:0005892\"/>\n",
                           "          <rdf:li rdf:resource=\"http://www.ebi.ac.uk/interpro/#IPR002394\"/>\n",
                           "        </rdf:Bag>\n",
                           "      </bqbiol:isVersionOf>\n",
                           "      <bqbiol:is>\n",
                           "        <rdf:Bag>\n",
                           "          <rdf:li rdf:resource=\"http://www.geneontology.org/#GO:0005895\"/>\n",
                           "        </rdf:Bag>\n",
                           "      </bqbiol:is>\n",
                           "    </rdf:Description>\n",
                           "  </rdf:RDF>\n",
                           "</annotation>\n",
                           sep = "");


SBase_appendAnnotation(s, cvterms_annotation);

#
# The above code can be replaced by the code in addCVTerms.R.
#

# The SBML document with annotation added can be written using
# writeSBML(doc, "nameOfOutputFile.xml")

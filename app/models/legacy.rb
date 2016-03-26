# == Schema Information
#
# Table name: legacies
#
#  id                               :uuid             not null, primary key
#  gml_id                           :string
#  oid                              :integer
#  search_id                        :string
#  reference                        :string
#  titre_courant                    :string
#  type_dossier                     :string
#  denomination                     :string
#  cadre_etude                      :string
#  affixe_cadre_etude               :string
#  date_enquete                     :string
#  date_bordereau                   :string
#  nature_dossier                   :string
#  phase                            :string
#  destinations                     :string
#  parties_constituantes_non_etudie :string
#  adresse                          :string
#  lieu_dit                         :string
#  commune                          :string
#  datations_principales            :string
#  datations_secondaires            :string
#  materiaux_murs                   :string
#  materiaux_toit                   :string
#  protection                       :string
#  dates_protection                 :string
#  statut                           :string
#  selection                        :string
#  aire_etude                       :string
#  lien_dossier                     :string
#  lien_image                       :string
#  date_modif                       :string
#  geometry_type                    :string
#  longitude                        :float
#  latitude                         :float
#  created_at                       :datetime
#  updated_at                       :datetime
#
# Indexes
#
#  index_legacies_on_adresse        (adresse)
#  index_legacies_on_aire_etude     (aire_etude)
#  index_legacies_on_commune        (commune)
#  index_legacies_on_denomination   (denomination)
#  index_legacies_on_latitude       (latitude)
#  index_legacies_on_lieu_dit       (lieu_dit)
#  index_legacies_on_longitude      (longitude)
#  index_legacies_on_titre_courant  (titre_courant)
#  index_legacies_on_type_dossier   (type_dossier)
#

class Legacy < ActiveRecord::Base
end

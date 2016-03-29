class CreateLegacies < ActiveRecord::Migration
  def change
    create_table :legacies, id: :uuid do |t|
      t.string :gml_id
      t.integer :oid
      t.string :search_id
      t.string :reference
      t.string :titre_courant
      t.string :type_dossier
      t.string :denomination
      t.string :cadre_etude
      t.string :affixe_cadre_etude
      t.string :date_enquete
      t.string :date_bordereau
      t.string :nature_dossier
      t.string :phase
      t.string :destinations
      t.string :parties_constituantes_non_etudie
      t.string :adresse
      t.string :lieu_dit
      t.string :commune
      t.string :datations_principales
      t.string :datations_secondaires
      t.string :materiaux_murs
      t.string :materiaux_toit
      t.string :protection
      t.string :dates_protection
      t.string :statut
      t.string :selection
      t.string :aire_etude
      t.string :lien_dossier
      t.string :lien_image
      t.string :date_modif
      t.string :geometry_type
      t.float :longitude
      t.float :latitude

      t.timestamps
    end

    add_index :legacies, :longitude
    add_index :legacies, :latitude
    add_index :legacies, :titre_courant
    add_index :legacies, :lieu_dit
    add_index :legacies, :adresse
    add_index :legacies, :commune
    add_index :legacies, :datations_principales
  end
end

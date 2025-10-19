class Bodygraph
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :birth_date, :string
  attribute :birth_time, :string
  attribute :birth_country, :string
  attribute :birth_city, :string
  attribute :latitude, :float
  attribute :longitude, :float
  attribute :timezone, :string
  attribute :birth_date_utc, :string
  attribute :design_date_utc, :string
  attribute :aura_type, :string
  attribute :inner_authority, :string
  attribute :definition, :string
  attribute :profile, :string
  attribute :incarnation_cross, :string
  attribute :cognition, :string
  attribute :sense, :string
  attribute :variable, :string
  attribute :determination, :string
  attribute :environment, :string
  attribute :view, :string
  attribute :motivation, :string
  attribute :personality_activations, :string
  attribute :design_activations, :string
  attribute :head_defined, :boolean
  attribute :ajna_defined, :boolean
  attribute :throat_defined, :boolean
  attribute :spleen_defined, :boolean
  attribute :solar_plexus_defined, :boolean
  attribute :g_center_defined, :boolean
  attribute :sacral_defined, :boolean
  attribute :root_defined, :boolean
  attribute :ego_defined, :boolean
  attribute :personality_nodes_tone, :integer
  attribute :design_nodes_tone, :integer
  attribute :all_activated_gates, :string

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :birth_time, presence: true
  validates :birth_country, presence: true
  validates :birth_city, presence: true

  def self.from_api_response(data)
    new(
      name: data['name'],
      birth_date: data['birth_date'],
      birth_time: data['birth_time'],
      birth_country: data['birth_country'],
      birth_city: data['birth_city'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      timezone: data['timezone'],
      birth_date_utc: data['birth_date_utc'],
      design_date_utc: data['design_date_utc'],
      aura_type: data['aura_type'],
      inner_authority: data['inner_authority'],
      definition: data['definition'],
      profile: data['profile'],
      incarnation_cross: data['incarnation_cross'],
      cognition: data['cognition'],
      sense: data['sense'],
      variable: data['variable'],
      determination: data['determination'],
      environment: data['environment'],
      view: data['view'],
      motivation: data['motivation'],
      personality_activations: data['personality_activations'].to_json,
      design_activations: data['design_activations'].to_json,
      head_defined: data['head_defined'],
      ajna_defined: data['ajna_defined'],
      throat_defined: data['throat_defined'],
      spleen_defined: data['spleen_defined'],
      solar_plexus_defined: data['solar_plexus_defined'],
      g_center_defined: data['g_center_defined'],
      sacral_defined: data['sacral_defined'],
      root_defined: data['root_defined'],
      ego_defined: data['ego_defined'],
      personality_nodes_tone: data['personality_nodes_tone'],
      design_nodes_tone: data['design_nodes_tone'],
      all_activated_gates: data['all_activated_gates'].to_json
    )
  end

  def personality_activations_hash
    JSON.parse(personality_activations) if personality_activations
  end

  def design_activations_hash
    JSON.parse(design_activations) if design_activations
  end

  def all_activated_gates_array
    JSON.parse(all_activated_gates) if all_activated_gates
  end

  def defined_centers
    centers = []
    centers << 'Head' if head_defined
    centers << 'Ajna' if ajna_defined
    centers << 'Throat' if throat_defined
    centers << 'Spleen' if spleen_defined
    centers << 'Solar Plexus' if solar_plexus_defined
    centers << 'G Center' if g_center_defined
    centers << 'Sacral' if sacral_defined
    centers << 'Root' if root_defined
    centers << 'Ego' if ego_defined
    centers
  end

  def strategy
    case aura_type
    when 'Generator', 'Manifesting Generator'
      'To Respond'
    when 'Manifestor'
      'To Inform'
    when 'Projector'
      'Wait to be Invited'
    when 'Reflector'
      'Wait a Lunar Cycle'
    end
  end

  def not_self_theme
    case aura_type
    when 'Generator', 'Manifesting Generator'
      'Frustration'
    when 'Manifestor'
      'Anger'
    when 'Projector'
      'Bitterness'
    when 'Reflector'
      'Disappointment'
    end
  end

  def signature
    case aura_type
    when 'Generator', 'Manifesting Generator'
      'Satisfaction'
    when 'Manifestor'
      'Peace'
    when 'Projector'
      'Success'
    when 'Reflector'
      'Surprise'
    end
  end
end

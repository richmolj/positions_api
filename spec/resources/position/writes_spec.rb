require 'rails_helper'

RSpec.describe PositionResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'positions',
          attributes: attributes_for(:position)
        }
      }
    end

    let(:instance) do
      PositionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Position.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:position) { create(:position) }

    let(:payload) do
      {
        data: {
          id: position.id.to_s,
          type: 'positions',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PositionResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { position.reload.updated_at }
      # .and change { position.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:position) { create(:position) }

    let(:instance) do
      PositionResource.find(id: position.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Position.count }.by(-1)
    end
  end
end

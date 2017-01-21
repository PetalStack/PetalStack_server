require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all projects as @projects" do
      project = Builders::ProjectBuilder.new.build
      get :index, params: {}, session: valid_session
      expect(assigns :projects) === (project)
    end
  end

  describe "GET #show" do
    it "assigns the requested project as @project" do
      project = Builders::ProjectBuilder.new.build
      get :show, params: {id: project.to_param}, session: valid_session
      expect(:project) === (project)
    end
  end

    describe "POST #create" do
    context "with valid params" do
      it "creates a new Project" do
        expect {
          post :create,
          params: {project: Builders::ProjectBuilder.new.get_valid_obj },
          session: valid_session
        }.to change(Project, :count).by(1)
      end

    #   it "assigns a newly created project as @project" do
    #     post :create,
    #       params: {project: Builders::ProjectBuilder.new.get_valid_obj},
    #       session: valid_session
    #     expect(assigns(:project)).to be_a(Project)
    #     expect(assigns(:project)).to be_persisted
    #   end
    #
    #   it "redirects to the created project" do
    #     post :create,
    #       params: {project: Builders::ProjectBuilder.new.get_valid_obj},
    #       session: valid_session
    #     expect(response).to redirect_to(Project.last)
    #   end
     end

    context "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        post :create,
          params: {project: Builders::ProjectBuilder.new.get_invalid_obj},
          session: valid_session
      expect(assigns(:project)).to be_a_new(Project)
      end
      #
      # it "re-renders the 'new' template" do
      #   post :create,
      #     params: {project: Builders::ProjectBuilder.new.get_invalid_obj},
      #     session: valid_session
      #   expect(response).to render_template("create")
      # end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested project" do
        project = Builders::ProjectBuilder.new.build
        put :update,
          params: {
            id: project.to_param,
            project: Builders::ProjectBuilder.new.get_new_params
          },
          session: valid_session
        project.reload
        expect(project.title).to eq 'New Title'
        expect(response).to have_http_status(:success)
      end

      it "assigns the requested project as @project" do
        project = Builders::ProjectBuilder.new.build
        put :update,
          params: {
            id: project.to_param,
            project: Builders::ProjectBuilder.new.get_new_params
          },
          session: valid_session
        expect(assigns(:project)).to eq(project)
      end

      it "redirects to the project" do
        project = Builders::ProjectBuilder.new.build

        put :update,
          params: {
            id: project.to_param,
            project: Builders::ProjectBuilder.new.get_new_params
          },
          session: valid_session
          expect(response).to have_http_status(:success)
          #expect(response.body).to look_like_json
      end
    end

    context "with invalid params" do
      it "assigns the project as @project" do
        project = Builders::ProjectBuilder.new.build
        put :update,
          params: {
            id: project.to_param,
            project: Builders::ProjectBuilder.new.get_invalid_obj
          },
          session: valid_session
        expect(assigns(:project)).to eq(project)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested project" do
      project = Builders::ProjectBuilder.new.build
      expect {
        delete :destroy,
          params: {
            id: project.to_param
          },
          session: valid_session
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      project = Builders::ProjectBuilder.new.build
      delete :destroy,
        params: {
          id: project.to_param
        },
        session: valid_session
      expect(response.body).to eq("")
    end
  end

end
